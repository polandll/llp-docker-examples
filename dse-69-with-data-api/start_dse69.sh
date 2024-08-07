#!/bin/bash

# require Docker Compose v2
if [[ ! $(docker compose version --short) =~ ^2. ]]; then
  echo "Docker compose v2 required. Please upgrade Docker Desktop to the latest version."
  exit 1
fi

# Default to INFO as root log level
LOGLEVEL=INFO

# Default to images used in project integration tests
DSETAG=6.9.0-rc.3
#DSETAG="$(../mvnw -f .. help:evaluate -Pdse69-it -Dexpression=stargate.int-test.cassandra.image-tag -q -DforceStdout)"

# Default to latest released version
DATAAPITAG="v1.0.13"
DATAAPIIMAGE="stargateio/data-api"
DSEONLY="false"

while getopts "dlqnr:j:" opt; do
  case $opt in
    l)
      DATAAPITAG="v$(../mvnw -f .. help:evaluate -Dexpression=project.version -q -DforceStdout)"
      ;;
    j)
      DATAAPITAG=$OPTARG
      ;;
    n)
      DATAAPIIMAGE="stargateio/data-api-native"
      ;;
    q)
      REQUESTLOG="true"
      ;;
    r)
      LOGLEVEL=$OPTARG
      ;;
    d)
      DSEONLY=true
      ;;
    \?)
      echo "Valid options:"
      echo "  -l - use Data API Docker image from local build (see project README for build instructions)"
      echo "  -j <tag> - use Data API Docker image tagged with specified Data API version (will pull images from Docker Hub if needed)"
      echo "  -n <tag> - use Data API native image instead of default Java-based image"
      echo "  -d - Start only dse container"
      echo "  -q - enable request logging for APIs in 'io.quarkus.http.access-log' (default: disabled)"
      echo "  -r - specify root log level for APIs (defaults to INFO); usually DEBUG, WARN or ERROR"
      exit 1
      ;;
  esac
done

export std_port=9042
export fwd_port=9037
export LOGLEVEL
export REQUESTLOG
export DSETAG
export DATAAPITAG
export DATAAPIIMAGE

echo "Running with DSE $DSETAG, Data API $DATAAPIIMAGE:$DATAAPITAG"

if [ "$DSEONLY" = "true" ]; then
  docker compose up -d --wait dse
  exit 0
else
  docker compose up -d --wait
fi
