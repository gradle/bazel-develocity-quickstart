#!/bin/bash
# See README.md for usage
SERVER=$1
KEY=$2

FLAGS="--remote_cache=grpcs://${SERVER} --bes_backend=grpcs://${SERVER} --bes_results_url=https://${SERVER}/build --remote_header=Authorization=${KEY} --bes_header=Authorization=${KEY}"
echo "common:develocity ${FLAGS}" > user.bazelrc