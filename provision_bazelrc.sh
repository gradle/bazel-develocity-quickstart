#!/bin/bash
# See README.md for usage
SERVER=$1
KEY=$2
BAZELRC_FILE="user.bazelrc"

echo "common:develocity --remote_cache=grpcs://${SERVER}" > $BAZELRC_FILE
echo "common:develocity --bes_backend=grpcs://${SERVER}" >> $BAZELRC_FILE 
echo "common:develocity --bes_results_url=https://${SERVER}/build" >> $BAZELRC_FILE
echo "common:develocity --remote_header=Authorization=${KEY}" >> $BAZELRC_FILE
echo "common:develocity --bes_header=Authorization=${KEY}" >> $BAZELRC_FILE