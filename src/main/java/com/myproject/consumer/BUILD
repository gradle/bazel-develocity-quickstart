java_binary(
    name = "consumer",
    srcs = glob(["*.java"]),
    main_class = "com.myproject.consumer.Consumer",
    deps = [
        "//src/main/java/com/myproject/producer"
    ],
    visibility = ["//visibility:public"]
)