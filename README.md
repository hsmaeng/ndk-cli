# 안드로이드 스튜디오 없이 NDK로 so파일 빌드하기

## Prerequisite
도커가 아닌 WSL2같은 환경에서 개발하려면 아래의 것들이 필요합니다.
- NDK
- CMake
- Ninja

만약 ubuntu 환경이라면 Dockerfile을 참조하셔서 패키지를 설치하면 될 것 같습니다.

## Docker
Docker를 사용하면 특별한 설정없이 환경 구성을 할 수 있습니다. Dockerfile로 이미지를 만들거나
```bash
docker build -t ndk/r21e:0.0 .
```
또는 도커 허브에서 이미지를 받으셔도 됩니다.
```bash
docker pull hsmaeng/ndk:r21e
```


## Build
아래 명령어를 통해 4개의 ABI(armeabi-v7a, arm64-v8a, x86, x86_64)로 빌드 할 수 있습니다.
```bash
build.sh
```
만약 Visual Studio Code를 사용한다면 settings.json파일을 수정해야 합니다.(하나의 ABI만 빌드 되므로)


## NDK_ROOT 환경 변수
Docker를 사용하지 않는다면 NDK_ROOT 환경 변수를 만들고 ndk 경로를 설정해야 합니다.
