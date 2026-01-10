#!/usr/bin/with-contenv bashio

# Log config
bashio::log.info "Starting MongoDB..."

# Ensure /share/mongodb exists (bashio handles)
bashio::log.info "Data path: /data/db (persistent)"

# Export config to env vars for official entrypoint
bashio::config_has_value 'root_username' && \
  export MONGO_INITDB_ROOT_USERNAME=$(bashio::config 'root_username')

bashio::config_has_value 'root_password' && \
  export MONGO_INITDB_ROOT_PASSWORD=$(bashio::config 'root_password')

# Optional init scripts from /share/initdb.d/*.js
bashio::config.set_bool 'init_scripts' true && \
  bashio::log.info "Init scripts enabled, place .js in /share/initdb.d/" && \
  cp -r /share/initdb.d/* /docker-entrypoint-initdb.d/ || true

# Exec official entrypoint
exec "$@"
