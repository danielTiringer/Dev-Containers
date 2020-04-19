#!/bin/bash
docker run -it --rm -v $PWD:$PWD -w $PWD composer "$@"
# curl -L -O  https://github.com/laravel/laravel/archive/v"$1".tar.gz
# tar -zxvf v"$1".tar.gz
# rm v"$1".tar.gz
