FROM alpine:edge

WORKDIR /root
ENV LANG en_US.UTF-8
ADD bootstrap.sh /tmp/bootstrap.sh
ADD build.mk /tmp/build.mk
ADD config.yaml /tmp/config.yaml
RUN sh /tmp/bootstrap.sh
ENV PATH /root/.local/bin:`/root/.local/bin/stack --no-terminal path --compiler-bin`:$PATH
