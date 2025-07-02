#!/usr/bin/env bash

DEVELOCITY_HOST=""
CACHE_HOST=""
KEY=""
INSECURE=false
PROJECT_ID="bazel-develocity-quickstart"

while [[ $# -gt 0 ]]; do
  case "$1" in
    --develocity-host)
      DEVELOCITY_HOST="$2"
      shift 2
      ;;
    --cache-host)
      CACHE_HOST="$2"
      shift 2
      ;;
    --project-id)
      PROJECT_ID="$2"
      shift 2
      ;;
    --key)
      KEY="$2"
      shift 2
      ;;
    --insecure)
      INSECURE=true
      BES_URI_SCHEME=grpc
      DV_URI_SCHEME=http
      shift
      ;;
    *)
      echo "Unknown parameter: $1"
      exit 1
      ;;
  esac
done

if [[ -z "$DEVELOCITY_HOST" ]]; then
  echo "Error: --develocity-host is required"
  exit 1
fi

if [[ -z "$CACHE_HOST" ]]; then
  CACHE_HOST="$DEVELOCITY_HOST"
fi

if [[ "$INSECURE" == false ]]; then
  BES_URI_SCHEME=grpcs
  DV_URI_SCHEME=https
fi

# Reset the contents of user.bazelrc
echo -n "" > user.bazelrc

# Write configurations to user.bazelrc
echo "build:develocity --remote_cache=${BES_URI_SCHEME}://${CACHE_HOST}" >> user.bazelrc
echo "build:develocity --bes_backend=${BES_URI_SCHEME}://${CACHE_HOST}" >> user.bazelrc
echo "build:develocity --bes_results_url=${DV_URI_SCHEME}://${DEVELOCITY_HOST}/build" >> user.bazelrc
echo "build:develocity --bes_instance_name=${PROJECT_ID}" >> user.bazelrc

if [[ -n "$KEY" ]]; then
  echo "build:develocity --remote_header=Authorization=\"Bearer ${KEY}\"" >> user.bazelrc
  echo "build:develocity --bes_header=Authorization=\"Bearer ${KEY}\"" >> user.bazelrc
fi

# Validate Bazel version
BAZEL_VERSION=$(bazel --version | awk '{print $2}')
BAZEL_MAJOR_VERSION=$(echo "$BAZEL_VERSION" | cut -d '.' -f 1)

if [[ "$BAZEL_MAJOR_VERSION" -gt 6 ]]; then
  echo "common:develocity --noenable_bzlmod" >> user.bazelrc
  echo "common:develocity --enable_workspace" >> user.bazelrc
fi