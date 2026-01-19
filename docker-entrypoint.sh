#!/usr/bin/env bash
set -e

# 1) 初始化/升级元数据库（幂等）
superset db upgrade

# 2) 创建 admin（如果已存在会失败，所以用 python 包一层更稳）
python - << 'PY'
import os
from superset import app
from superset.security import SupersetSecurityManager

username = os.getenv("ADMIN_USERNAME", "admin")
email = os.getenv("ADMIN_EMAIL", "gorchicshop@gmail.com")
password = os.getenv("ADMIN_PASSWORD", "djk*hoklHGD.")
firstname = os.getenv("ADMIN_FIRSTNAME", "YQ")
lastname = os.getenv("ADMIN_LASTNAME", "Admin")

with app.app_context():
    sm: SupersetSecurityManager = app.appbuilder.sm
    user = sm.find_user(username=username)
    if not user:
        sm.add_user(username, firstname, lastname, email, sm.find_role("Admin"), password)
        print("Admin user created:", username)
    else:
        print("Admin user exists:", username)
PY

# 3) 初始化（幂等）
superset init

# 4) 启动
exec gunicorn \
  --bind 0.0.0.0:${PORT:-8088} \
  --workers 2 \
  --threads 8 \
  --timeout 120 \
  "superset.app:create_app()"
