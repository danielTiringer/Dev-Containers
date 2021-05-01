#!/usr/bin/env bash

export GO111MODULE=off

cd ~/
go get github.com/oxequa/realize
cd /go/src/github.com/oxequa/realize && \
  git fetch && \
  git checkout v2.0.2 && \
  go get github.com/oxequa/realize

RV=$(realize --version)
echo "Realize installed @: $RV"

export GO111MODULE=on
