java_test(
    name = "ProducerTest",
    srcs = ["ProducerTest.java"],
    deps = [
        "//src/main/java/com/myproject/producer",
         "@maven//:junit_junit"
    ],
)

java_test(
    name = "OtherProducerTest",
    test_class = "com.myproject.producer.ProducerTest",
    srcs = ["ProducerTest.java"],
    deps = [
        "//src/main/java/com/myproject/producer",
         "@maven//:junit_junit"
    ],
)