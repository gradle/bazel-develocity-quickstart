#!/bin/bash
# See README.md for usage
SERVER=$1
KEY=$2

echo "common:develocity --remote_cache=grpcs://${SERVER}" > user.bazelrc
echo "common:develocity --bes_backend=grpcs://${SERVER}" >> user.bazelrc
echo "common:develocity --bes_results_url=https://${SERVER}/build" >> user.bazelrc
echo "common:develocity --remote_header=Authorization=${KEY}" >> user.bazelrc
echo "common:develocity --bes_header=Authorization=${KEY}" >> user.bazelrc