load("@bazel_tools//tools/jdk:local_java_repository.bzl", "local_java_runtime")

platform(
    name = "linux_x86",
    parents = ["@local_config_platform//:host"],
    constraint_values = [
        "@platforms//os:linux",
        "@platforms//cpu:x86_64",
    ],
    exec_properties = {
        "container-image": "docker://ghcr.io/catthehacker/ubuntu:act-22.04@sha256:5f9c35c25db1d51a8ddaae5c0ba8d3c163c5e9a4a6cc97acd409ac7eae239448",
        "OSFamily": "linux",
    },
)

alias(
    name = "jdk",
    actual = "rbe_jdk",
)

local_java_runtime(
    name = "rbe_jdk",
    java_home = "/usr/lib/jvm/java-8-openjdk-amd64",
    version = "1.8.0_265",
)
