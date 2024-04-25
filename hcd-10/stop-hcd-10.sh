#!/bin/sh

export HCDTAG=7.0.0-alpha.4
export std_port=9042
export fwd_port=9030
export node_name_1='backend-hcd10-1'
export node_name_2='backend-hcd10-2'
export node_name_3='backend-hcd10-3'

docker compose down --remove-orphans