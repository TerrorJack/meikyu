FROM alpine:edge

WORKDIR /root
ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:/root/.stack/programs/x86_64-linux/ghc-8.3.20171118/bin:$PATH
ADD bootstrap.sh build.mk config.yaml https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171022/stack-1.6.0.20171022-linux-x86_64-static.tar.gz /tmp/
ADD repositories /etc/apk/
RUN sh -e /tmp/bootstrap.sh
