FROM alpine:edge

WORKDIR /root
ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:/root/.cabal/bin:/root/.stack/programs/x86_64-linux/ghc-8.5.20171207/bin:$PATH
ADD bootstrap.sh build.mk cabal config.yaml https://github.com/commercialhaskell/stack/releases/download/v1.6.0.20171202/stack-1.6.0.20171202-linux-x86_64-static.tar.gz /tmp/
ADD repositories /etc/apk/
RUN sh -e /tmp/bootstrap.sh
