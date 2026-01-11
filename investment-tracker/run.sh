#!/usr/bin/with-contenv bashio
echo "Running Investment Tracker add-on..."
set -e

# Export environment variables from HA add-on config
export FINANZBLICK_USERNAME=$(bashio::config 'FINANZBLICK_USERNAME')
export FINANZBLICK_PASSWORD=$(bashio::config 'FINANZBLICK_PASSWORD')
export FINANZBLICK_MFA_SECRET=$(bashio::config 'FINANZBLICK_MFA_SECRET')
export ALPHAVANTAGE_API_KEY=$(bashio::config 'ALPHAVANTAGE_API_KEY')
export SLACK_BOT_TOKEN=$(bashio::config 'SLACK_BOT_TOKEN')
export MONGO_DB_CONNECTION_STRING=$(bashio::config 'MONGO_DB_CONNECTION_STRING')
export DEBUG=$(bashio::config 'DEBUG')

bashio::log.info "Starting Investment Tracker script..."

# If debug enabled run infinitive sleep loop to allow attaching debugger
if [ "$DEBUG" = "true" ]; then
    bashio::log.info "Debug mode enabled. Sleeping indefinitely to allow debugger attachment."
    while true; do sleep 1000; done
fi

# Run your original app
exec /app/docker_start_script.sh