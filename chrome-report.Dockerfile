ARG SUPERSET_VERSION=2.1.0
FROM ghcr.io/hienduyph/superset:${SUPERSET_VERSION}

USER root

RUN apt-get update && \
  wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
  apt-get install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb && \
  rm -f google-chrome-stable_current_amd64.deb

RUN export CHROMEDRIVER_VERSION=$(curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE_114) && \
  wget -q https://chromedriver.storage.googleapis.com/${CHROMEDRIVER_VERSION}/chromedriver_linux64.zip && \
  unzip chromedriver_linux64.zip -d /usr/bin && \
  chmod 755 /usr/bin/chromedriver && \
  rm -f chromedriver_linux64.zip

USER superset
