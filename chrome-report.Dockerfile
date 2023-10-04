ARG SUPERSET_VERSION=2.1.0
FROM ghcr.io/hienduyph/superset:${SUPERSET_VERSION}

USER root
RUN apt update && apt install -y --no-install-recommends curl unzip \
  && curl -LO https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb \
  && apt install -y --no-install-recommends ./google-chrome-stable_current_amd64.deb \
  && rm -f google-chrome-stable_current_amd64.deb \
  && curl -LO https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/117.0.5938.149/linux64/chromedriver-linux64.zip \
  && unzip chromedriver-linux64.zip -d /tmp \
  && mv /tmp/chromedriver-linux64/chromedriver /usr/bin \
  && chmod 755 /usr/bin/chromedriver \
  && rm -f chromedriver-linux64.zip \
  && apt remove curl unzip -y && apt autoremove -y \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

USER superset
