#!/bin/sh

export DSETAG=6.9.0
export std_port=9042
export fwd_port=9034
export node_name_1='backend-dse69-1'
export node_name_2='backend-dse69-2'
export node_name_3='backend-dse69-3'

docker compose down --remove-orphans