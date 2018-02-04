#define BUILD        "19700101"
#define PACKAGE_NAME "libjpeg-turbo"
#define VERSION      "1.5.3"

#if defined(__GNUC__)
#define INLINE inline __attribute__((always_inline))
#elif defined(_MSC_VER)
#define INLINE __forceinline
#else
#define INLINE
#endif
