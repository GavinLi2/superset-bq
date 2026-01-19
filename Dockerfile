FROM apache/superset:latest

# 安装 BigQuery SQLAlchemy 驱动（官方推荐）
RUN pip install --no-cache-dir sqlalchemy-bigquery

# （可选）如果你要用 service account JSON 文件方式鉴权，通常不需要额外装包
# google-auth 在依赖链里一般会带上；缺啥再补 pip install

ENV SUPERSET_ENV=production
