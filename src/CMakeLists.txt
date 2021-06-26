add_library(hello SHARED)

target_sources(hello PRIVATE JniLoader.cpp)
