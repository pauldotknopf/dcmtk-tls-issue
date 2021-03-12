#!/usr/bin/env bash

apt-get update && apt-get install -y dcmtk

storescp --log-level trace --enable-tls /work/domain.key /work/domain.crt -ic 104 &

sleep 2

echoscu +tla -ic localhost 104