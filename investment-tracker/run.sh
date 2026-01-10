#!/bin/bash

set -e
echo "Starting Investment Tracker script..."

# Export all HA add-on options as environment variables
export FINANZBLICK_USERNAME=$(bashio::config 'FINANZBLICK_USERNAME')
export FINANZBLICK_PASSWORD=$(bashio::config 'FINANZBLICK_PASSWORD')
export FINANZBLICK_MFA_SECRET=$(bashio::config 'FINANZBLICK_MFA_SECRET')
export ALPHAVANTAGE_API_KEY=$(bashio::config 'ALPHAVANTAGE_API_KEY')
export SLACK_BOT_TOKEN=$(bashio::config 'SLACK_BOT_TOKEN')
export MONGO_DB_CONNECTION_STRING=$(bashio::config 'MONGO_DB_CONNECTION_STRING')

bashio::log.info "Starting Investment Tracker script..."

# Run your original start script
exec /app/docker_start_script.sh