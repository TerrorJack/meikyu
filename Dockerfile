FROM terrorjack/meikyu:ghc-8.2.2-llvm-5

ADD bootstrap.sh /tmp/bootstrap.sh
RUN sh -e /tmp/bootstrap.sh
