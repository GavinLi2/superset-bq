ARG CACHE_BUST=1

FROM apache/superset:latest

USER root
COPY requirements-local.txt /app/requirements-local.txt
COPY railway-start.sh /app/railway-start.sh
RUN pip install --no-cache-dir -r /app/requirements-local.txt \
    && chmod +x /app/railway-start.sh

USER superset
