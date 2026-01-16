FROM apache/superset:3.1.0

USER root

COPY requirements-local.txt /app/requirements-local.txt
COPY railway-start.sh /app/railway-start.sh

RUN /app/python3/bin/pip install --no-cache-dir --upgrade pip \
 && /app/python3/bin/pip install --no-cache-dir --upgrade -r /app/requirements-local.txt \
 && chmod +x /app/railway-start.sh

USER superset
