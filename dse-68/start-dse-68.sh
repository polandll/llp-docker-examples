#!/bin/sh

echo -e "\nenter the number of nodes you want to bring up: (1-3)"
read num_nodes

export DSETAG=6.8.48
export std_port=9042
export fwd_port=9030
export node_name_1='backend-dse68-1'
export node_name_2='backend-dse68-2'
export node_name_3='backend-dse68-3'

if [ "$num_nodes" -eq 1 ]; then
    # Make sure node_name_1, the seed node, is up before bringing up other nodes and stargate
    docker compose up -d ${node_name_1}
    # Wait until the seed node is up before bringing up more nodes
    (docker compose logs -f ${node_name_1} &) | grep -q "Created default superuser role"
    echo "Only one node requested, ${node_name_1} is up and running."
elif [ "$num_nodes" -eq 2 ]; then
    docker compose up -d ${node_name_1}
    (docker compose logs -f ${node_name_1} &) | grep -q "Created default superuser role"
    docker compose up -d ${node_name_2}
    (docker compose logs -f ${node_name_2} &) | grep -q "is now part of the cluster"
    echo "Two nodes requested, ${node_name_1} and ${node_name_2} are up and running."
elif [ "$num_nodes" -eq 3 ]; then
    docker compose up  -d ${node_name_1}
    (docker compose logs -f ${node_name_1} &) | grep -q "Created default superuser role"
    docker compose up  -d ${node_name_2}
    (docker compose logs -f ${node_name_2} &) | grep -q "is now part of the cluster"
    docker compose up  -d ${node_name_3}
    (docker compose logs -f ${node_name_3} &) | grep -q "is now part of the cluster"
    echo "Three nodes requested, ${node_name_1}, ${node_name_2}, and ${node_name_3} are up and running."
fi
