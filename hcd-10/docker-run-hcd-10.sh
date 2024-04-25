#!/bin/sh

export HCDTAG=7.0.0-alpha.4

docker run -e DS_LICENSE=accept -p 9041:9042 cr.dtsx.io/datastax/dse-server:${HCDTAG}
