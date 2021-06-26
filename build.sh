#! /bin/bash

function cmake_configure() {
    cmake \
        -DCMAKE_TOOLCHAIN_FILE=${NDK_ROOT}/build/cmake/android.toolchain.cmake \
        -DANDROID_ABI=${ABI} \
        -DANDROID_PLATFORM=android-26 \
        -DANDROID_NDK=${NDK_ROOT} \
        -G Ninja \
        -S . \
        -B ${BUILD_DIR}
}

function cmake_build() {
    cmake --build ${BUILD_DIR} --target all
}

function cmake_rebuild() {
    cmake --build ${BUILD_DIR} --clean-first
}

function cmake_clean() {
    cmake --build ${BUILD_DIR} --target clean
}

for ABI in armeabi-v7a arm64-v8a x86 x86_64
  do
    BUILD_DIR=build/${ABI}
    cmake_configure
    cmake_build
  done
