#!/usr/bin/env bash
set -e

# bashio env
export MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'root_username')
export MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'root_password')

exec docker-entrypoint.sh mongod --bind_ip_all