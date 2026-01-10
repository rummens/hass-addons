FROM registry.gitlab.com/rummens/public-registry/investment-tracker:latest

ENV BASHIO_VERSION="0.17.5"
ADD https://github.com/hassio-addons/bashio/archive/v${BASHIO_VERSION}.tar.gz /tmp/v${BASHIO_VERSION}.tar.gz
RUN mkdir -p /tmp/bashio && \
    tar -xzf /tmp/v${BASHIO_VERSION}.tar.gz --strip 1 -C /tmp/bashio && \
    mv /tmp/bashio/lib /usr/lib/bashio && \
    ln -s /usr/lib/bashio/bashio /usr/bin/bashio && \
    rm -rf /tmp/bashio /tmp/v${BASHIO_VERSION}.tar.gz

# Copy data for add-on
COPY run.sh /
RUN chmod a+x /run.sh

CMD [ "/run.sh" ]