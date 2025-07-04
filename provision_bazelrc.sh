#!/usr/bin/env bash

DEVELOCITY_HOST=""
CACHE_HOST=""
KEY=""
INSECURE=false
PROJECT_ID="bazel-develocity-quickstart"

print_help() {
  echo "Usage: $0 [OPTIONS]"
  echo
  echo "Options:"
  echo "  --develocity-host HOST   (required) Develocity host name and port"
  echo "  --cache-host HOST        Remote cache host name and port (defaults to the value provided with \`--develocity-host\`)"
  echo "  --project-id ID          Project ID (defaults to \`bazel-develocity-quickstart\`)"
  echo "  --key KEY                Access key"
  echo "  --insecure               Use insecure (non-TLS) connections to connect to Develocity and the remote cache"
  echo "  -h, --help               Show this help message and exit"
}

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
    -h|--help)
      print_help
      exit 0
      ;;
    *)
      echo "Unknown parameter: $1"
      echo "Use -h or --help to see usage."
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
  echo "build:develocity --noenable_bzlmod" >> user.bazelrc
  echo "build:develocity --enable_workspace" >> user.bazelrc
fi
