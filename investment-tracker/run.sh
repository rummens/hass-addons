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

bashio::log.info "Starting Investment Tracker script..."

# Run your original app
exec /app/docker_start_script.sh