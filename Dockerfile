FROM public.ecr.aws/ubuntu/ubuntu:latest
ENV SML_VERSION v110.99.1

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
