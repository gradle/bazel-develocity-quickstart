#!/bin/bash

SERVER=$1
KEY=$2
FLAGS="--remote_cache=grpcs://${SERVER} --bes_backend=grpcs://${SERVER} --remote_header=Authorization=${KEY} --bes_header=Authorization=${KEY} --bes_results_url=https://${server}/build"
echo "common ${FLAGS}" > .bazelrc
echo "query ${FLAGS}" >> .bazelrc