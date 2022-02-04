FROM manticoresearch/manticore:latest

RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends cron && rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./reindex.cron /etc/cron.d/reindex.cron
COPY ./manticore.conf /etc/manticoresearch/manticore.conf

ENV CHECKING_FILE=posts_minute.spi
RUN crontab /etc/cron.d/reindex.cron

VOLUME /var/lib/manticore
