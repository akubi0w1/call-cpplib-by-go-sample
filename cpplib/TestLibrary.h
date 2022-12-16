#ifndef TEST_COMMON_H
#define TEST_COMMON_H

#ifdef __linux__
#define DLL_EXPORT
#else
#define DLL_EXPORT extern "C" __declspec(dllexport)
#endif

#define DLL_CALL __stdcall

// DLL_EXPORT double DLL_CALL Add(double a, double b);
DLL_EXPORT double Add(double a, double b);

#endif //TEST_COMMON_H