#!/bin/sh
set -e

superset db upgrade
superset fab create-admin \
  --username admin \
  --firstname Admin \
  --lastname User \
  --email "$ADMIN_EMAIL" \
  --password "$ADMIN_PASSWORD" || true
superset init

gunicorn --bind 0.0.0.0:${PORT:-8088} "superset.app:create_app()"
