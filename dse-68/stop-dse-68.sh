#!/bin/sh

export DSETAG=6.8.46
export std_port=9042
export fwd_port=9030
export node_name_1='backend-dse68-1'
export node_name_2='backend-dse68-2'
export node_name_3='backend-dse68-3'

docker compose down --remove-orphans