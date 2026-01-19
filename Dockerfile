FROM apache/superset:latest

USER root
RUN pip install --no-cache-dir --upgrade pip setuptools wheel

# BigQuery dialect（官方文档推荐）
RUN pip install --no-cache-dir sqlalchemy-bigquery

# 可选：如果你要支持“上传 CSV/Excel 到 BigQuery”
# RUN pip install --no-cache-dir pandas_gbq

USER superset
