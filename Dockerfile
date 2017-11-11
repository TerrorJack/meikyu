FROM terrorjack/meikyu:ghc-8.2.1.20171108

ADD bootstrap.sh /tmp/bootstrap.sh
RUN sh /tmp/bootstrap.sh
