import os

SECRET_KEY = os.environ.get("SUPERSET_SECRET_KEY", "change_me")

# 让 Superset 走 Render 注入的 PORT
# （不在这里配也行，启动命令里用 $PORT 就够）
