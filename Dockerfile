FROM ubuntu:eoan-20190813

ENV SML_VERSION v110.79

RUN apt update \
  && apt install -y \
    smlnj \
    rlwrap \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

RUN mkdir /app
WORKDIR /app

ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
