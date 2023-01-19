from mongo:4.4

RUN apt-get update \
  && apt-get install -y python3 python3-pip \
  && python3 -m pip install mtools[all]

VOLUME /mlaunch
WORKDIR /mlaunch

COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

ENV MLAUNCH_INIT_ARGS=--single

CMD []
