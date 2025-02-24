ARG SUPERSET_VERSION=2.1.0
FROM docker.io/apache/superset:${SUPERSET_VERSION}

USER root

RUN apt update  \
  && apt install -y pkg-config libmariadb-dev \
  && apt install --reinstall build-essential -y \
  && uv pip install --no-cache -e '.[postgres,trino,redshift,mysql,bigquery,gsheets,athena,clickhouse,cors,druid,mysql,redshift,starrocks,doris,presto,impala,elasticsearch,hive]' PyJWT==2.9.0 \
  && uv pip install --no-cache 'flask-appbuilder[oauth]' duckdb-engine Flask-OIDC Flask-OpenID  google-cloud-bigquery-storage \
  && apt autoremove -y pkg-config build-essential \
  && rm -rf /var/lib/{apt,dpkg,cache,log}/

USER superset
