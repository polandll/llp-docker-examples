#!/bin/sh

export DSETAG=5.1.43
export std_port=9042
export fwd_port=9032
export node_name_1='backend-dse51-1'
export node_name_2='backend-dse51-2'
export node_name_3='backend-dse51
-3'

docker compose down --remove-orphans
