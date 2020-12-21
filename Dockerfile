FROM sonarqube:7.9-community

LABEL maintainer="Alex Pullen <catilre@gmail.com>"

USER root

RUN apt-get clean \
    && apt-get update \
    && apt-get install -y git curl unzip \
    && rm -rf /var/lib/apt/lists/*

RUN cd /opt/ \
    && git clone https://github.com/flutter/flutter.git \
    && chown -R sonarqube:sonarqube /opt/flutter

ENV PATH="/opt/flutter/bin:${PATH}"
ENV PATH="/opt/flutter/bin/cache/dart-sdk/bin:${PATH}"

RUN flutter doctor

USER sonarqube

