#!/bin/sh

export DSETAG=6.8.8
export STUDIOTAG=latest

# Make sure backend-1, the seed node, is up before bringing up other nodes and stargate
docker compose up -d backend-1
# Wait until the seed node is up before bringing up more nodes
(docker compose logs -f backend-1 &) | grep -q "Created default superuser role"

# Bring up the 2nd DSE node
#docker compose up -f $COMPOSE_FILE -d backend-2
#(docker compose logs -f backend-2 &) | grep -q "is now part of the cluster"
# Bring up the 3rd DSE node
#docker compose up -f $COMPOSE_FILE -d backend-3
#(docker compose logs -f backend-3 &) | grep -q "is now part of the cluster"

# Bring up the studio
docker compose up -d studio
