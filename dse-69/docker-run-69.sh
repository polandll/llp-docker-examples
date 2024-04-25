#!/bin/sh

export DSETAG=6.9.0

docker run -p 9038:9042 datastax/dse-server:${DSETAG}
