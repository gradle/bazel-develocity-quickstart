# Develocity Bazel Quickstart

This project should help you quickly setup and test Develocity's [Bazel](https://bazel.build) functionality. 

## Setup

You need three things to start using Bazel with Develocity:
- a Develocity server with the Bazel license enabled. If you've used Develocity for other build tools, you could look inside `~/.gradle/enterprise/keys.properties` and select the server name you want to run against, and find an existing key.
- an access key to that server (see above).
- permissions to publish a Build Scan. For enhanced build scan data with performance profile information, you must also have the "Read build cache data and write Bazel CAS data" permission enabled.
  
Then run 

``./provision_bazelrc.sh --server <server_address> --key <key>`` from this folder to provision a `user.bazelrc` file that will include the necessary settings to allow Bazel to communicate with the Develocity server. This file will be private, and unique to you.

_Note: Exclude any `https://` prefixes from the `server_address`_

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
Open the link to see the Build Scan.


## Develocity Bazel Configuration Documentation
For further information about configuring Develocity for Bazel, please see our [public documentation](https://docs.gradle.com/develocity/bazel-configuration/)