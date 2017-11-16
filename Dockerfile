FROM terrorjack/meikyu:ghc-8.2.1.20171108

ADD bootstrap.sh https://bitbucket.org/malb/m4ri/downloads/m4ri-20140914.tar.gz https://github.com/msoos/cryptominisat/archive/5.0.1.tar.gz https://github.com/Z3Prover/z3/archive/z3-4.5.0.tar.gz /tmp/
RUN sh -e /tmp/bootstrap.sh
