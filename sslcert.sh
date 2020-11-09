#!/usr/bin/env bash

SCRIPTPATH="$(cd "$(dirname "$0")" ; pwd -P)"

docker run \
  -v "$SCRIPTPATH/ssl:/ssl/" \
  -u "$(id -u):$(id -g)" \
  --env-file "$SCRIPTPATH/.env" \
 goacme/lego \
  --email="james.gray@thereforsunrise.com" \
  --accept-tos \
  --path="/ssl" \
  --domains="thereforsunrise.com" \
  --dns="linodev4" \
  --dns.resolvers ns1.linode.com \
  "renew"

docker run \
  -v "$SCRIPTPATH/ssl:/ssl/" \
  -u "$(id -u):$(id -g)" \
  --env-file "$SCRIPTPATH/.env" \
 goacme/lego \
  --email="james.gray@thereforsunrise.com" \
  --accept-tos \
  --path="/ssl" \
  --domains="*.thereforsunrise.com" \
  --dns="linodev4" \
  --dns.resolvers ns1.linode.com \
  "renew"
