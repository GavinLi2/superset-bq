FROM apache/superset:latest

USER root
COPY requirements-local.txt /app/requirements-local.txt
RUN pip install --no-cache-dir -r /app/requirements-local.txt

USER superset
