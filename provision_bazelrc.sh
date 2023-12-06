#!/bin/bash
# See README.md for usage
SERVER=$1
KEY=$2
BAZELRC_FILE="user.bazelrc"

cat > $BAZELRC_FILE << EOF
common:develocity --remote_cache=grpcs://${SERVER} 
common:develocity --bes_backend=grpcs://${SERVER}
common:develocity --bes_results_url=https://${SERVER}/build
common:develocity --remote_header=Authorization=${KEY}
common:develocity --bes_header=Authorization=${KEY}
EOF