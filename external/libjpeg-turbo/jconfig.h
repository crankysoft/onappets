#include <stddef.h>

#if SIZE_MAX > 0xffffffff
#define SIZEOF_SIZE_T 8
#else
#define SIZEOF_SIZE_T 4
#endif

#define JPEG_LIB_VERSION             62
#define LIBJPEG_TURBO_VERSION        1.5.3
#define LIBJPEG_TURBO_VERSION_NUMBER 1005003

#define C_ARITH_CODING_SUPPORTED 1
#define D_ARITH_CODING_SUPPORTED 1
#define MEM_SRCDST_SUPPORTED     1

#define BITS_IN_JSAMPLE  8
//#define BITS_IN_JSAMPLE 12

//#define HAVE_LOCALE_H
#define HAVE_STDDEF_H 1
#define HAVE_STDLIB_H 1
#define HAVE_UNSIGNED_CHAR 1
#define HAVE_UNSIGNED_SHORT 1
//#define INCOMPLETE_TYPES_BROKEN 1
//#define NEED_BSD_STRINGS 1
//#define NEED_SYS_TYPES_H 1
//#define NEED_FAR_POINTERS
//#define RIGHT_SHIFT_IS_UNSIGNED 1
//#define __CHAR_UNSIGNED__ 1

#if defined(__ARM__NEON__) || defined(WIN32)
#define WITH_SIMD 1
#endif
