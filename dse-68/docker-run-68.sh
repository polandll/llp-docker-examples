#!/bin/sh

export DSETAG=6.8.43

docker run -p 9040:9042 datastax/dse-server:${DSETAG}
