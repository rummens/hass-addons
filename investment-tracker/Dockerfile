FROM registry.gitlab.com/rummens/public-registry/investment-tracker:latest

# Copy data for add-on
COPY run.sh /app/
RUN chmod a+x /run.sh

CMD [ "/app/run.sh" ]