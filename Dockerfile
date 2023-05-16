FROM debian:bullseye-slim
MAINTAINER fsm256

ENV TERM="xterm-256color"

RUN useradd -ms /bin/bash icecast

RUN apt-get update -y && apt-get upgrade -y \
 && apt-get install -y --no-install-recommends ca-certificates procps wget icecast2 libxml2 libtagc0 libshout3

RUN set -eux; \
   mkdir -p /tmp; \
   cd /tmp; \
   wget http://de.archive.ubuntu.com/ubuntu/pool/universe/e/ezstream/ezstream_1.0.1-1_amd64.deb; \
   dpkg -i /tmp/ezstream_1.0.1-1_amd64.deb

RUN mkdir -p /var/log/icecast
RUN mkdir /app
COPY . /app
WORKDIR /app
RUN chmod +x /app/entry.sh
RUN chown -R icecast /app

EXPOSE 8888

ENTRYPOINT ["/app/entry.sh"]
