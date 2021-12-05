FROM debian:stretch-20211201 AS builder

ENV SML_VERSION 110.99.2

RUN apt update \
  && apt install -y \
    build-essential \
    ml-antlr \
    rlwrap \
    wget \
  && apt clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/sml
RUN wget https://smlnj.org/dist/working/$SML_VERSION/config.tgz \
  && tar -xzf config.tgz \
  && sh config/install.sh


FROM debian:stretch-20211201
COPY --from=builder /usr/bin/rlwrap /usr/bin/rlwrap
COPY --from=builder /lib/x86_64-linux-gnu/libreadline.so.7 /lib/x86_64-linux-gnu/libreadline.so.7
COPY --from=builder /tmp/sml /var/lib/sml
RUN cd /var/lib/sml/bin \
  && find . |grep -v '^\.$' |xargs -I{} cp -r {} /usr/bin/.

WORKDIR /app
ADD entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
