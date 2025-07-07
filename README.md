# Bazel Develocity® quickstart

This is an example project that you can use to experience the [Build Scan® service of Develocity][gradle.com].

Follow the instructions in the following section to set up Bazel to publish Build Scan® data to a Develocity server.

## Create a Build Scan®

Follow these simple steps to create and publish a Build Scan®:

1. Clone this project
2. Follow the instructions in the [Setup](#Setup) section
3. Run `bazel test ...`

The build should end with something similar to:

    INFO: Invocation ID: cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3
    INFO: Streaming build results to: https://develocity.example.com/build/cd2f892e-05cd-4c53-b4fe-10cedfaeb6f3

Follow the link shown at the end of the build to view your Build Scan®.

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

### Example setups

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

## Experiment with Build Scans

Create different kinds of Build Scans by locally modifying this quickstart project. Here are some ideas:

- Edit `src/main/java/com/myproject/consumer/Consumer.java` to introduce compile errors
- Fix the flaky tests in `src/test/java/com/myproject/consumer/ConsumerTest.java`

## Learn more

Read the [Develocity Bazel Configuration User Manual][manual] to learn more about the Build Scan® service of Develocity, build caching and the Develocity support for Bazel.

## Need help?

Talk to us on the [Gradle forum][gradle-forum].

## License

The Bazel Develocity® quickstart project is open-source software released under the [Apache 2.0 License][apache-license].

[apache-license]: https://www.apache.org/licenses/LICENSE-2.0.html
[manual]: https://docs.gradle.com/develocity/bazel-configuration/
[gradle.com]: https://www.gradle.com
[gradle-forum]: https://discuss.gradle.org/c/help-discuss/scans