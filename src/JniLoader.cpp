#include "jni.h"

static double add(JNIEnv *, jclass, double a, double b) { return a + b; }

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *) {
    JNIEnv *env;
    if (vm->GetEnv(reinterpret_cast<void **>(&env), JNI_VERSION_1_6) != JNI_OK) {
        return JNI_ERR;
    }

    jclass clazz = env->FindClass("com/maengs/Test");
    if (clazz == nullptr) {
        return JNI_ERR;
    }

    const JNINativeMethod methods[] = {
        {"add", "(DD)D", reinterpret_cast<void *>(add)}};

    if (env->RegisterNatives(clazz, methods, sizeof(methods) / sizeof(JNINativeMethod))) {
        return JNI_ERR;
    }

    return JNI_VERSION_1_6;
}
