#!/bin/sh

export CASSTAG=5.0
export std_port=9042
export fwd_port=9031
export node_name_1='backend-cass-1'
export node_name_2='backend-cass-2'
export node_name_3='backend-cass-3'

docker compose down --remove-orphans