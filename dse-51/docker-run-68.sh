#!/bin/sh

export DSETAG=5.1.43

docker run -p 9039:9042 datastax/dse-server:${DSETAG}
