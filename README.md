# Gradle Enterprise Bazel Quickstart

This project should help you quickly setup and test GE's Bazel functionality. First of all, look in ~/.gradle/enterprise/keys.properties and select the server  name you want to run against. Then run ``./provision_bazelrc.sh <server_address> <key>`` from this folder to provision a .bazelrc that will let you talk to the server. Then do bazel build //... or bazel test //... to quickly see the caching and scans functionality
