FROM alpine:edge

ARG GHC_LIB_VER
ARG GHC_REV
ARG GHC_VER
ARG GITHUB_ACCESS_TOKEN
WORKDIR /root
ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:/root/.cabal/bin:/root/.stack/programs/x86_64-linux/ghc-8.5.20171207/bin:$PATH
ADD bootstrap.sh build.mk cabal config.yaml https://github.com/commercialhaskell/stack/releases/download/v1.6.1/stack-1.6.1-linux-x86_64-static.tar.gz /tmp/
ADD repositories /etc/apk/
RUN GHC_LIB_VER=${GHC_LIB_VER} GHC_REV=${GHC_REV} GHC_VER=${GHC_VER} GITHUB_ACCESS_TOKEN=${GITHUB_ACCESS_TOKEN} sh -e /tmp/bootstrap.sh
