#!/usr/bin/env bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


docker run --rm -v $(pwd):/work debian:buster bash -c "/work/test.sh"