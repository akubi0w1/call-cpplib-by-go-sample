#ifndef TEST_COMMON_H
#define TEST_COMMON_H

#define DLL_EXPORT extern "C" __declspec(dllexport)
#define DLL_CALL __stdcall

DLL_EXPORT double DLL_CALL Add(double a, double b);

#endif //TEST_COMMON_H