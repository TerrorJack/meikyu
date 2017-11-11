#!/bin/sh

stack --no-terminal --resolver nightly-2017-11-10 setup
stack --no-terminal install --haddock alex c2hs cpphs happy hscolour hspec-discover
