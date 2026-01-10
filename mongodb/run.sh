#!/usr/bin/env bash
set -e

CONFIG_PATH="/data/options.json"

# Parse config with jq
MONGO_INITDB_ROOT_USERNAME=$(jq -r '.root_username // empty' "$CONFIG_PATH")
MONGO_INITDB_ROOT_PASSWORD=$(jq -r '.root_password // empty' "$CONFIG_PATH")

if [ -z "$MONGO_INITDB_ROOT_USERNAME" ] || [ -z "$MONGO_INITDB_ROOT_PASSWORD" ]; then
  echo "Error: root_username and root_password required in $CONFIG_PATH"
  exit 1
fi

echo "Configuring MongoDB root: $MONGO_INITDB_ROOT_USERNAME"

export MONGO_INITDB_ROOT_USERNAME MONGO_INITDB_ROOT_PASSWORD

exec docker-entrypoint.sh mongod --bind_ip_all
