#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    alsa-lib-dev \
    bzip2-dev \
    curl-dev \
    file-dev \
    freeglut-dev \
    icu-dev \
    libgit2-dev \
    libsndfile-dev \
    libxft-dev \
    libxml2-dev \
    libxrandr-dev \
    libzip-dev \
    lmdb-dev \
    mariadb-dev \
    nettle-dev \
    pcre-dev \
    postgresql-dev \
    sdl2_image-dev \
    sdl2_mixer-dev \
    sdl2_ttf-dev \
    zeromq-dev

stack --no-terminal --resolver nightly-2017-11-21 install --haddock \
    accelerate-llvm-native \
    Agda \
    alarmclock \
    alex \
    apecs \
    apply-refact \
    arithmoi \
    atom-conduit \
    backprop \
    bench \
    bitcoin-api-extra \
    bound \
    brittany \
    c2hs \
    cabal-install \
    cabal-rpm \
    cabal-toolkit \
    cassava \
    cast \
    Chart-diagrams \
    chart-unit \
    classy-prelude-yesod \
    compact \
    cpphs \
    curl \
    dhall \
    dhall-bash \
    dhall-json \
    dhall-nix \
    dhall-text \
    dimensional \
    direct-rocksdb \
    distributed-closure \
    distributed-process-simplelocalnet \
    distributed-process-tests \
    djinn-ghc \
    docker-build-cacher \
    doctest \
    effect-handlers \
    ekg \
    emailaddress \
    errors-ext \
    ersatz \
    esqueleto \
    ether \
    eventstore \
    extensible-effects \
    extrapolate \
    feed \
    fixed-vector-hetero \
    free-vl \
    generic-lens \
    ghc-events \
    ghcid \
    git \
    git-annex \
    github \
    github-webhook-handler-snap \
    github-release \
    gloss \
    gnuplot \
    GPipe \
    groundhog-inspector \
    groundhog-mysql \
    groundhog-postgresql \
    hapistrano \
    happy \
    hasmin \
    hasql-migration \
    haxl \
    hedgehog-quickcheck \
    hindent \
    hint \
    hit \
    hjsmin \
    hjsonschema \
    hlint \
    hoogle \
    hopenpgp-tools \
    hpack \
    hpp \
    hprotoc \
    hscolour \
    hsexif \
    hsndfile-vector \
    hspec-checkers \
    hspec-discover \
    hworker \
    influxdb \
    inline-c-cpp \
    integration \
    intero \
    irc-client \
    json-autotype \
    katip-elasticsearch \
    katydid \
    language-java \
    LibZip \
    lmdb \
    machines-binary \
    machines-directory \
    machines-io \
    megaparsec \
    messagepack-rpc \
    milena \
    mmark-ext \
    morte \
    netwire-input \
    network-anonymous-i2p \
    network-anonymous-tor \
    network-msgpack-rpc \
    network-transport-composed \
    network-transport-inmemory \
    network-transport-tests \
    open-browser \
    operational \
    pandoc \
    pandoc-citeproc \
    pcre-heavy \
    pdf-toolbox-document \
    perf \
    persistent-mongoDB \
    persistent-mysql \
    persistent-mysql-haskell \
    persistent-postgresql \
    persistent-refs \
    persistent-sqlite \
    persistent-template \
    pretty-show \
    protobuf-simple \
    protocol-buffers-descriptor \
    proto-lens-arbitrary \
    proto-lens-combinators \
    proto-lens-optparse \
    proto-lens-protobuf-types \
    quickbench \
    raaz \
    rainbox \
    reactive-banana \
    relational-record \
    repa-algorithms \
    repa-io \
    SafeSemaphore \
    sbv \
    scalpel \
    sdl2-image \
    sdl2-mixer \
    sdl2-ttf \
    selda-postgresql \
    selda-sqlite \
    servant-client \
    servant-swagger-ui \
    servant-websockets \
    shake \
    shake-language-c \
    ShellCheck \
    soap-openssl \
    squeal-postgresql \
    stm-containers \
    stylish-haskell \
    swish \
    tardis \
    tasty-quickcheck \
    tasty-smallcheck \
    TCache \
    text-icu \
    threepenny-editors \
    threepenny-gui-flexbox \
    transient-universe \
    tree-diff \
    twitter-conduit \
    type-combinators-singletons \
    unagi-chan \
    unbound-generics \
    unboxed-ref \
    unification-fd \
    union users-persistent \
    users-postgresql-simple \
    users-test \
    utf8-light \
    vcswrapper \
    viewprof \
    wai-app-static \
    wai-websockets \
    webdriver \
    websockets-rpc \
    weigh \
    wreq \
    yaml \
    Yampa \
    xeno \
    xmonad \
    xmonad-extras \
    zeromq4-haskell \
    zippers \
    zm

rm /tmp/bootstrap.sh
