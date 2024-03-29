#!/bin/sh

export CASSTAG=5.0-alpha2
#export ZEPPTAG=0.9.0

# Make sure backend-1, the seed node, is up before bringing up other nodes and stargate
docker compose up -d backend-1
# Wait until the seed node is up before bringing up more nodes
(docker compose logs -f backend-1 &) | grep -q "Created default superuser role"

# Bring up the 2nd C* node
#docker compose up -f $COMPOSE_FILE -d backend-2
#(docker compose logs -f backend-2 &) | grep -q "is now part of the cluster"
# Bring up the 3rd C* node
#docker compose up -f $COMPOSE_FILE -d backend-3
#(docker compose logs -f backend-3 &) | grep -q "is now part of the cluster"

# Bring up zeppelin
#docker compose up -d zeppelin
