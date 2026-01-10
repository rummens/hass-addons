FROM mongo:8.2.3

RUN apt-get update && apt-get install -y jq && apt-get clean && rm -rf /var/lib/apt/lists/*

COPY run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 27017

CMD [ "/run.sh" ]
