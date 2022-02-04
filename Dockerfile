FROM manticoresearch/manticore:latest

RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends util-linux cron && rm -rf /var/lib/apt/lists/*

COPY ./docker-entrypoint.sh /usr/local/bin/
COPY ./reindex.cron /etc/cron.d/reindex.cron
ENV CHECKING_FILE=threads.spm

RUN crontab /etc/cron.d/reindex.cron
