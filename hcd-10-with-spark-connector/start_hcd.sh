#!/bin/bash

# require Docker Compose v2
if [[ ! $(docker compose version --short) =~ ^2. ]]; then
  echo "Docker compose v2 required. Please upgrade Docker Desktop to the latest version."
  exit 1
fi

# Default to INFO as root log level
LOGLEVEL=INFO

# Default to images used in project integration tests
#HCDTAG="$(../mvnw -f .. help:evaluate -Phcd-it -Dexpression=stargate.int-test.cassandra.image-tag -q -DforceStdout)"
export HCDTAG=1.0.0-rc.1

# Default to latest released version
HCDONLY="false"

while getopts "dlqnr:j:" opt; do
  case $opt in
    q)
      REQUESTLOG="true"
      ;;
    r)
      LOGLEVEL=$OPTARG
      ;;
    d)
      HCDONLY="true"
      ;;
    \?)
      echo "Valid options:"
      echo "  -d - Start only HCD container"
      echo "  -q - enable request logging for APIs in 'io.quarkus.http.access-log' (default: disabled)"
      echo "  -r - specify root log level for APIs (defaults to INFO); usually DEBUG, WARN or ERROR"
      exit 1
      ;;
  esac
done

export std_port=9042
export fwd_port=9038
export LOGLEVEL
export REQUESTLOG
export HCDTAG

echo "Running with DSE $DSETAG, Spark"

if [ "$HCDONLY" = "true" ]; then
  docker compose -f docker-compose-hcd.yml up -d --wait hcd
  exit 0
else
  docker compose -f docker-compose-hcd.yml up -d --wait
fi
