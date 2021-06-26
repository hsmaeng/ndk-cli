FROM ububtu:20.04

RUN apt update && DEBIAN_FRONTEND=noninteractive apt install -y \
    clang-format \
    cmake \
    git \
    ninja-build \
    sudo \
    vim \
    wget \
    zip \
    && rm -rf /var/lib/apt/lists/*

ARG ndk_version=r21e
ARG ndk_archive=android-ndk-${ndk_version}-linux-x86_64.zip
ARG ndk_dir=/android/ndk

RUN wget -q https://dl.google.com/android/repository/${ndk_archive} && \
    mkdir -p ${ndk_dir} && \
    unzip -q ${ndk_archive} -d ${ndk_dir} && \
    rm -f ${ndk_archive}

ENV NDK_ROOT ${ndk_dir}/android-ndk-${ndk_version}

ARG user=maengs
RUN adduser ${user} && adduser ${user} sudo && passwd -d ${user}
USER ${user}
WORKDIR /home/${user}
