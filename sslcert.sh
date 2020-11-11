#!/usr/bin/env bash

SCRIPTPATH="$(cd "$(dirname "$0")" ; pwd -P)"

source "$SCRIPTPATH/.env"

for domain in $DOMAINS; do
  docker run \
    -v "$SCRIPTPATH/ssl:/ssl/" \
    -u "$(id -u):$(id -g)" \
    --env-file "$SCRIPTPATH/.env" \
    goacme/lego \
    --email="$EMAIL" \
    --accept-tos \
    --path="/ssl" \
    --domains="$domain" \
    --dns="linodev4" \
    --dns.resolvers ns1.linode.com \
    "renew"
done
