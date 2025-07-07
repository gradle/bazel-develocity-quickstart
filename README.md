# Bazel Develocity® quickstart

This is an example project that you can use to experience the [Build Scan® service of Develocity][gradle.com].

Follow the instructions in the following section to set up Bazel to publish Build Scan® data to a Develocity server.

## Setup

You need three things to start using Bazel with Develocity:
- a Develocity server with the Bazel license enabled. If you've used Develocity for other build tools, you could look inside `~/.gradle/develocity/keys.properties` and select the server name you want to run against, and find an existing key.
- an access key to that server (see above).
- permissions to publish a Build Scan. For enhanced Build Scan data with performance profile information, you must also have the "Read build cache data and write Bazel CAS data" permission enabled.
  
Then run 

``./provision_bazelrc.sh --develocity-host <develocity_host> [--cache-host <cache_host>] [--project-id <project_id>] [--key <key>] [--insecure]`` from this folder to provision a `user.bazelrc` file that will include the necessary settings to allow Bazel to communicate with the Develocity server. This file will be private, and unique to you.

- `--develocity-host` is mandatory and specifies the host name and port for Build Scan results. It must not include the URI scheme.
- `--cache-host` is optional and specifies the host name and port for remote cache and BES backend. If not provided, it defaults to the value of `--develocity-host`. It must not include the URI scheme.
- `--project-id` is optional and specifies the project identifier to be used as the `bes_instance_name`. If not provided, it defaults to `bazel-develocity-quickstart`. If your Develocity server has project-level access control enabled, make sure to use a project ID you have access to.
- `--key` is optional and provides the access key for authentication.
- `--insecure` is optional and switches the URI schemes for the Develocity and cache addresses to `http` and `grpc` instead of `https` and `grpcs`.

## Example setups

Here are a few example usages of `./provision_bazelrc.sh`:

1. Provision with mandatory parameters:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com
   ```
   This sets up the `user.bazelrc` file using `develocity.example.com` for Build Scan results and remote cache/BES backend.

2. Provision with a separate cache host:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com --cache-host cache.example.com
   ```
   This sets up the `user.bazelrc` file using `develocity.example.com` for Build Scan results and `cache.example.com` for remote cache/BES backend.

3. Provision with an access key:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com --key abc123
   ```
   This includes the access key `abc123` for authentication.

4. Provision with insecure mode:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com --insecure
   ```
   This switches the URI scheme to `http` and `grpc` instead of `https` and `grpcs`.

5. Full example:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com --cache-host cache.example.com --key abc123 --insecure
   ```
   This sets up the `user.bazelrc` file with all options enabled.

6. Provision with a custom project ID:
   ```bash
   ./provision_bazelrc.sh --develocity-host develocity.example.com --project-id custom-project
   ```
   This sets up the `user.bazelrc` file using `develocity.example.com` for Build Scan results and remote cache/BES backend, and specifies `custom-project` as the `bes_instance_name`.

## Smoke test

```
bazel test ...
```

to quickly see the caching and scans functionality. A few tests have been made flaky on purpose so that you can see how they are displayed in the "Tests" dashboard.

You should see a link at the beginning of the build, and also at the end, similar to:

```
INFO: Invocation ID: cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3
INFO: Streaming build results to: https://develocity.example.com/build/cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3
```
Open the link to see the Build Scan report.

## Develocity Bazel Configuration Documentation

For further information about configuring Develocity for Bazel, please see our [public documentation](https://docs.gradle.com/develocity/bazel-configuration/).