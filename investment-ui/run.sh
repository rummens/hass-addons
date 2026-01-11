#!/usr/bin/with-contenv bashio
echo "Running Investment UI add-on..."
set -e

# Export environment variables from HA add-on config
export SECRET_KEY=$(bashio::config 'SECRET_KEY')
export MONGO_DB_CONNECTION_STRING=$(bashio::config 'MONGO_DB_CONNECTION_STRING')
export DEBUG=$(bashio::config 'DEBUG')

bashio::log.info "Starting Investment UI app..."

# Run your original app
exec /app/docker_start_script.sh