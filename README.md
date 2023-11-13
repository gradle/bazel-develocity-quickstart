# Gradle Enterprise Bazel Quickstart

This project should help you quickly setup and test GE's Bazel functionality. 

## Setup

You need two things to start using Bazel with Develocity:
- a Develocity server with the Bazel feature enabled. If you've used Develocity for other build tools, you could look inside `~/.gradle/enterprise/keys.properties` and select the server name you want to run against, and find an existing key
- an access key to that server (see above)
  
Then run 

``./provision_bazelrc.sh <server_address> <key>`` from this folder to provision a .bazelrc that will let you talk to the server. 

## Smoke test

```
bazel test //...
```

to quickly see the caching and scans functionality. You should see a link at the beginning of the build, and also at the end, similar to:

```
INFO: Invocation ID: cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3
INFO: Streaming build results to: https://ge-bazel-dogfooding.grdev.net/build/cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3
..
```
Open the link to see the build scan.
