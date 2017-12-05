#!/bin/sh -e

apk upgrade --no-cache --no-progress
apk add --no-cache --no-progress \
    icu-dev \
    pcre-dev \
    postgresql-dev \
    zeromq-dev

stack --no-terminal --resolver nightly-2017-12-05 install --haddock --keep-going \
    accelerate-io \
    accelerate-llvm-native \
    Agda \
    alex \
    ansi-wl-pprint \
    apply-refact \
    arithmoi \
    backprop \
    bench \
    bloodhound \
    bound \
    brittany \
    c2hs \
    cabal-install \
    compact \
    dhall \
    dhall-bash \
    dhall-json \
    dhall-nix \
    dhall-text \
    doctest \
    ekg \
    ersatz \
    ghcid \
    git-annex \
    happy \
    hedgehog-quickcheck \
    hindent \
    hlint \
    hoogle \
    hpack \
    hscolour \
    hslua \
    hworker \
    integration \
    irc-client \
    linear \
    megaparsec \
    morte \
    open-browser \
    pandoc \
    pandoc-citeproc \
    pcre-heavy \
    recursion-schemes \
    sbv \
    selda-postgresql \
    selda-sqlite \
    servant-client \
    servant-server \
    shake \
    shake-language-c \
    singletons \
    stylish-haskell \
    tasty \
    twitter-conduit \
    unbound-generics \
    vcswrapper \
    weigh \
    zeromq4-haskell

rm /tmp/bootstrap.sh
