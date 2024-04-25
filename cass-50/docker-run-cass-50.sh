#!/bin/sh

export CASSTAG=5.0
export std_port=9042
export fwd_port=9040

docker run -p ${fwd_port}:${std_port} cassandra:${CASSTAG}