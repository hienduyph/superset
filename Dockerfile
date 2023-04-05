ARG SUPERSET_VERSION=2.1.0
FROM docker.io/apache/superset:${SUPERSET_VERSION}

USER root

RUN pip install --no-cache -e '.[postgres,trino,redshift,mysql,bigquery,gsheets,athena,clickhouse,cors,excel,druid,mysql,presto,redshift,spark]'\
  && pip install --no-cache 'flask-appbuilder[oauth]' duckdb-engine

USER superset
