FROM terrorjack/meikyu:ghc-8.2.1.20171108

ADD bootstrap.sh https://github.com/Z3Prover/z3/archive/z3-4.5.0.tar.gz /tmp/
RUN sh -e /tmp/bootstrap.sh
