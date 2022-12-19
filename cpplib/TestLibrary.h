#ifndef TEST_COMMON_H
#define TEST_COMMON_H

#ifdef __linux__
#define DLL_EXPORT extern "C"
#define DLL_CALL
#else
#define DLL_EXPORT extern "C" __declspec(dllexport)
#define DLL_CALL __stdcall
#endif

DLL_EXPORT double DLL_CALL Add(double a, double b);

#endif //TEST_COMMON_H