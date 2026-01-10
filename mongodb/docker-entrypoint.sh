#!/usr/bin/env bashio
# shellcheck shell=bash
# shellcheck disable=SC2155,SC2015
set -Eeuo pipefail

# Source bashio
if ! source /usr/lib/bashio/bashio.sh; then
    echo "Failed to source bashio. Exiting."
    exit 1
fi

# Retrieve configuration from bashio
USERNAME=$(bashio::config 'MONGO_INITDB_USERNAME')
PASSWORD=$(bashio::config 'MONGO_INITDB_PASSWORD')
ROOT_PASSWORD=$(bashio::config 'MONGO_INITDB_ROOT_PASSWORD')

echo "Starting MongoDB with user: $USERNAME"

if [ -z "$ROOT_PASSWORD" ]; then
  echo "Error: No root password set."
  echo "Set it in the add-on options."
  exit 1
fi

# Init if needed
if [ ! -d /data/db ]; then
  mkdir -p /data/db
  mongod --bind_ip 0.0.0.0 --dbpath /data/db --logpath /data/db/mongod.log --fork
  mongo --eval "db.createUser({user: 'root', pwd: '${ROOT_PASSWORD}', roles: ['root']})" admin
  mongo --eval "db.createUser({user: '${USERNAME}', pwd: '${PASSWORD}', roles: ['readWriteAnyDatabase', 'userAdminAnyDatabase']})" admin
  killall mongod
  rm /data/db/mongod.lock
fi

exec mongod --bind_ip 0.0.0.0 \
  --auth \
  --dbpath /data/db \
  --logpath /data/db/mongod.log \
  --nohttpinterface \
  --storageEngine=wiredTiger \
  --wiredTigerCacheSizeGB=1