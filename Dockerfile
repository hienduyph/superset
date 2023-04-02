ARG SUPERSET_VERSION=2.0.1
FROM docker.io/apache/superset:${SUPERSET_VERSION}

USER root

RUN pip install --no-cache -e '.[postgres,trino,redshift,mysql,bigquery,gsheets,athena,clickhouse,cors,excel,druid,mysql,presto,redshift,spark]'\
  && pip install --no-cache 'flask-appbuilder[oauth]' \
  && pip install --upgrade 'clickhouse-connect>=0.5.14, <1.0' duckdb-engine

USER superset
