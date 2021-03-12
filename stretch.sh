#!/usr/bin/env bash

cd "$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"


docker run --rm -v $(pwd):/work debian:stretch bash -c "/work/test.sh"