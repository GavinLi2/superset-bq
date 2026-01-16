FROM apache/superset:latest

USER root

COPY requirements-local.txt /app/requirements-local.txt
COPY railway-start.sh /app/railway-start.sh

RUN /app/.venv/bin/pip install --no-cache-dir --upgrade pip \
 && /app/.venv/bin/pip install --no-cache-dir --upgrade -r /app/requirements-local.txt \
 && chmod +x /app/railway-start.sh

USER superset
