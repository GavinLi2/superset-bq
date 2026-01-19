FROM apache/superset:latest

USER root

# 安装 BigQuery 相关依赖
RUN pip install --no-cache-dir \
  "apache-superset[bigquery]" \
  pybigquery \
  google-cloud-bigquery \
  google-auth \
  pydata-google-auth

# 复制启动脚本
COPY docker-entrypoint.sh /usr/local/bin/docker-entrypoint.sh
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

USER superset

ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]
