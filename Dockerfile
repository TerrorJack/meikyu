FROM alpine:edge

ARG GHC_LIB_VER
ARG GHC_REV
ARG GHC_VER
ARG GITHUB_ACCESS_TOKEN
ARG GHC_CONF_OPTS
WORKDIR /root
ENV LANG en_US.UTF-8
ENV PATH /root/.local/bin:/root/.stack/programs/x86_64-linux/ghc-${GHC_VER}/bin:$PATH
ADD bootstrap.sh build.mk config.yaml https://github.com/commercialhaskell/stack/releases/download/v1.6.3/stack-1.6.3-linux-x86_64-static.tar.gz /tmp/
ADD repositories /etc/apk/
RUN GHC_LIB_VER=${GHC_LIB_VER} GHC_REV=${GHC_REV} GHC_VER=${GHC_VER} GITHUB_ACCESS_TOKEN=${GITHUB_ACCESS_TOKEN} GHC_CONF_OPTS=${GHC_CONF_OPTS} sh -e /tmp/bootstrap.sh
