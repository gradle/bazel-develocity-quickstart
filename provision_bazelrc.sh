#!/bin/bash
# See README.md for usage
#
function print_help() {
  echo """
Provision user.bazelrc with the relevant DV configuration.
Arguments:
  --server    Address of the DV instance to reach, without protocol prefix (i.e. without https or http).
  --key       API key to access DV.
  --local  If present, ports will be configured for the default localhost ports. There is no need to set other flags if this flag is present.
  """
}
for arg in "$@"
do
    case $arg in
        "--server" )
           SERVER=$arg;;
        "--key" )
           KEY=$arg;;
        "--local" )
           IS_LOCAL=true;;
        "--help" )
           print_help; exit 0;;
        "-h" )
           print_help; exit 0;;
        "usage" )
           print_help; exit 0;;
   esac
done

flags="--remote_cache=grpcs://${SERVER} --bes_backend=grpcs://${SERVER} --bes_results_url=https://${SERVER}/build --remote_header=Authorization=${KEY} --bes_header=Authorization=${KEY}"
if [[ "${IS_LOCAL}" ]]; then
  flags="--remote_cache=grpc://localhost:6011 --bes_backend=grpc://localhost:6011 --bes_results_url=http://localhost:5086"
fi

echo "common:develocity ${flags}" > user.bazelrc
