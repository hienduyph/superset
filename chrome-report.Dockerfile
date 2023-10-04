ARG SUPERSET_VERSION=2.1.0
FROM ghcr.io/hienduyph/superset:${SUPERSET_VERSION}

USER root
RUN apt update && apt install -y --no-install-recommends curl unzip \
  && curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb \
  && rm -f google-chrome-stable_current_amd64.deb \
  && curl -LO https://chromedriver.storage.googleapis.com/$(curl --silent https://chromedriver.storage.googleapis.com/LATEST_RELEASE_114)/chromedriver_linux64.zip \
  && unzip chromedriver_linux64.zip -d /usr/bin \
  && chmod 755 /usr/bin/chromedriver \
  && rm -f chromedriver_linux64.zip \
  && apt remove curl unzip -y && apt autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER superset
