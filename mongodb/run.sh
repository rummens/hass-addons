#!/usr/bin/env bash
set -e

# bashio env
export MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'root_username')
export MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'root_password')

echo "Starting MongoDB with root user: $MONGO_INITDB_ROOT_USERNAME and password: $MONGO_INITDB_ROOT_PASSWORD"

exec docker-entrypoint.sh mongod --bind_ip_all