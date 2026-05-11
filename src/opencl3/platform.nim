## *****************************************************************************
##  Copyright (c) 2008-2020 The Khronos Group Inc.
##
##  Licensed under the Apache License, Version 2.0 (the "License");
##  you may not use this file except in compliance with the License.
##  You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
##  Unless required by applicable law or agreed to in writing, software
##  distributed under the License is distributed on an "AS IS" BASIS,
##  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
##  See the License for the specific language governing permissions and
##  limitations under the License.
## ****************************************************************************

import
  ./[version]

export version

##  #if defined(WIN32)
##      #if !defined(CL_API_ENTRY)
##          #define CL_API_ENTRY
##      #endif
##      #if !defined(CL_API_CALL)
##          #define CL_API_CALL     __stdcall
##      #endif
##      #if !defined(CL_CALLBACK)
##          #define CL_CALLBACK     __stdcall
##      #endif
##  #else
##      #if !defined(CL_API_ENTRY)
##          #define CL_API_ENTRY
##      #endif
##      #if !defined(CL_API_CALL)
##          #define CL_API_CALL
##      #endif
##      #if !defined(CL_CALLBACK)
##          #define CL_CALLBACK
##      #endif
##  #endif
##
##  Deprecation flags refer to the last version of the header in which the
##  feature was not deprecated.
##
##  E.g. VERSION_1_1_DEPRECATED means the feature is present in 1.1 without
##  deprecation but is deprecated in versions later than 1.1.
##


when (defined(WIN32) and defined(MSC_VER)):
  when defined(clang):
    discard
  #  intptr_t is used in cl.h and provided by stddef.h in Visual C++, but not in clang
  #  stdint.h was missing before Visual Studio 2010, include it for later versions and for clang
  # when defined(clang) or MSC_VER >= 1600:
  #   discard
  #  scalar types
  type
    int8_t {.importc: "int8_t", nodecl.} = int8
    uint8_t {.importc: "uint8_t", nodecl.} = uint8
    int16_t {.importc: "int16_t", nodecl.} = int16
    uint16_t {.importc: "uint16_t", nodecl.} = uint16
    int32_t {.importc: "int32_t", nodecl.} = int32
    uint32_t {.importc: "uint32_t", nodecl.} = uint32
    int64_t {.importc: "int8_t", nodecl.} = int64
    uint64_t {.importc: "int8_t", nodecl.} = uint64

    Char* = int8_t
    Uchar* = uint8_t
    Short* = int16_t
    Ushort* = uint16_t
    Int* = int32_t
    Uint* = uint32_t
    Long* = uint64_t
    Ulong* = uint64_t

    Half* = uint16_t
    Float* = cfloat
    Double* = cdouble

  when defined(clang):
    discard
  #  Macro names and corresponding values defined by OpenCL
  const
    CHAR_BIT* = 8
    SCHAR_MAX* = 127
    SCHAR_MIN* = (-127 - 1)
    CHAR_MAX* = SCHAR_MAX
    CHAR_MIN* = SCHAR_MIN
    UCHAR_MAX* = 255
    SHRT_MAX* = 32767
    SHRT_MIN* = (-32767 - 1)
    USHRT_MAX* = 65535
    INT_MAX* = 2147483647
    INT_MIN* = (-2147483647 - 1)
    UINT_MAX* = 0xffffffff
    LONG_MAX* = (cast[Long](0x7FFFFFFFFFFFFFFF'u))
    LONG_MIN* = (cast[Long](- 0x7FFFFFFFFFFFFFFF'u - 1'i64))
    ULONG_MAX* = (cast[Ulong](0xFFFFFFFFFFFFFFFF'u))
    FLT_DIG* = 6
    FLT_MANT_DIG* = 24
    FLT_MAX_10_EXP* = +38
    FLT_MAX_EXP* = +128
    FLT_MIN_10_EXP* = -37
    FLT_MIN_EXP* = -125
    FLT_RADIX* = 2
    FLT_MAX* = 340282346638528859811704183484516925440.0f
    FLT_MIN* = 1.175494350822287507969e-38f
    FLT_EPSILON* = 1.1920928955078125e-7f
    HALF_DIG* = 3
    HALF_MANT_DIG* = 11
    HALF_MAX_10_EXP* = +4
    HALF_MAX_EXP* = +16
    HALF_MIN_10_EXP* = -4
    HALF_MIN_EXP* = -13
    HALF_RADIX* = 2
    HALF_MAX* = 65504.0f
    HALF_MIN* = 6.103515625e-05f
    HALF_EPSILON* = 9.765625e-04f
    DBL_DIG* = 15
    DBL_MANT_DIG* = 53
    DBL_MAX_10_EXP* = +308
    DBL_MAX_EXP* = +1024
    DBL_MIN_10_EXP* = -307
    DBL_MIN_EXP* = -1021
    DBL_RADIX* = 2
    DBL_MAX* = 1.7976931348623158e+308
    DBL_MIN* = 2.225073858507201383090e-308
    DBL_EPSILON* = 2.220446049250313080847e-16
    M_E* = 2.7182818284590452354
    M_LOG2E* = 1.4426950408889634074
    M_LOG10E* = 0.43429448190325182765
    M_LN2* = 0.69314718055994530942
    M_LN10* = 2.30258509299404568402
    M_PI* = 3.14159265358979323846
    M_PI_2* = 1.57079632679489661923
    M_PI_4* = 0.78539816339744830962
    M_1_PI* = 0.31830988618379067154
    M_2_PI* = 0.63661977236758134308
    M_2_SQRTPI* = 1.12837916709551257390
    M_SQRT2* = 1.41421356237309504880
    M_SQRT1_2* = 0.70710678118654752440
    M_E_F* = 2.718281828f
    M_LOG2E_F* = 1.442695041f
    M_LOG10E_F* = 0.434294482f
    M_LN2_F* = 0.693147181f
    M_LN10_F* = 2.302585093f
    M_PI_F* = 3.141592654f
    M_PI_2_F* = 1.570796327f
    M_PI_4_F* = 0.785398163f
    M_1_PI_F* = 0.318309886f
    M_2_PI_F* = 0.636619772f
    M_2_SQRTPI_F* = 1.128379167f
    M_SQRT2_F* = 1.414213562f
    M_SQRT1_2_F* = 0.707106781f
    NAN* = (INFINITY - INFINITY)
    HUGE_VALF* = (cast[Float](1e50))
    HUGE_VAL* = (cast[Double](1e500))
    MAXFLOAT* = FLT_MAX
    INFINITY* = HUGE_VALF
else:
  #  scalar types
  type
    int8_t {.importc: "int8_t", nodecl.} = int8
    uint8_t {.importc: "uint8_t", nodecl.} = uint8
    int16_t {.importc: "int16_t", nodecl.} = int16
    uint16_t {.importc: "uint16_t", nodecl.} = uint16
    int32_t {.importc: "int32_t", nodecl.} = int32
    uint32_t {.importc: "uint32_t", nodecl.} = uint32
    int64_t {.importc: "int8_t", nodecl.} = int64
    uint64_t {.importc: "int8_t", nodecl.} = uint64

    Char* = int8_t
    Uchar* = uint8_t
    Short* = int16_t
    Ushort* = uint16_t
    Int* = int32_t
    Uint* = uint32_t
    Long* = int64_t
    Ulong* = uint64_t
    Half* = uint16_t

    Float* = cfloat
    Double* = cdouble
  #  Macro names and corresponding values defined by OpenCL
  const
    CHAR_BIT* = 8
    SCHAR_MAX* = 127
    SCHAR_MIN* = (-127 - 1)
    CHAR_MAX* = SCHAR_MAX
    CHAR_MIN* = SCHAR_MIN
    UCHAR_MAX* = 255
    SHRT_MAX* = 32767
    SHRT_MIN* = (-32767 - 1)
    USHRT_MAX* = 65535
    INT_MAX* = 2147483647
    INT_MIN* = (-2147483647 - 1)
    UINT_MAX* = 0xffffffff
    LONG_MAX* = (cast[Long](0x7FFFFFFFFFFFFFFF))
    LONG_MIN* = ((cast[Long](-0x7FFFFFFFFFFFFFFF'i64 - 1'i64)))
    ULONG_MAX* = (cast[Ulong](0xFFFFFFFFFFFFFFFF))
    FLT_DIG* = 6
    FLT_MANT_DIG* = 24
    FLT_MAX_10_EXP* = +38
    FLT_MAX_EXP* = +128
    FLT_MIN_10_EXP* = -37
    FLT_MIN_EXP* = -125
    FLT_RADIX* = 2
    FLT_MAX* = 340282346638528859811704183484516925440.0f
    FLT_MIN* = 1.175494350822287507969e-38f
    FLT_EPSILON* = 1.1920928955078125e-7f
    HALF_DIG* = 3
    HALF_MANT_DIG* = 11
    HALF_MAX_10_EXP* = +4
    HALF_MAX_EXP* = +16
    HALF_MIN_10_EXP* = -4
    HALF_MIN_EXP* = -13
    HALF_RADIX* = 2
    HALF_MAX* = 65504.0f
    HALF_MIN* = 6.103515625e-05f
    HALF_EPSILON* = 9.765625e-04f
    DBL_DIG* = 15
    DBL_MANT_DIG* = 53
    DBL_MAX_10_EXP* = +308
    DBL_MAX_EXP* = +1024
    DBL_MIN_10_EXP* = -307
    DBL_MIN_EXP* = -1021
    DBL_RADIX* = 2
    DBL_MAX* = 179769313486231570814527423731704356798070567525844996598917476803157260780028538760589558632766878171540458953514382464234321326889464182768467546703537516986049910576551282076245490090389328944075868508455133942304583236903222948165808559332123348274797826204144723168738177180919299881250404026184124858368.0
    DBL_MIN* = 2.225073858507201383090e-308
    DBL_EPSILON* = 2.220446049250313080847e-16
    M_E* = 2.7182818284590452354
    M_LOG2E* = 1.4426950408889634074
    M_LOG10E* = 0.43429448190325182765
    M_LN2* = 0.69314718055994530942
    M_LN10* = 2.30258509299404568402
    M_PI* = 3.14159265358979323846
    M_PI_2* = 1.57079632679489661923
    M_PI_4* = 0.78539816339744830962
    M_1_PI* = 0.31830988618379067154
    M_2_PI* = 0.63661977236758134308
    M_2_SQRTPI* = 1.12837916709551257390
    M_SQRT2* = 1.41421356237309504880
    M_SQRT1_2* = 0.70710678118654752440
    M_E_F* = 2.718281828f
    M_LOG2E_F* = 1.442695041f
    M_LOG10E_F* = 0.434294482f
    M_LN2_F* = 0.693147181f
    M_LN10_F* = 2.302585093f
    M_PI_F* = 3.141592654f
    M_PI_2_F* = 1.570796327f
    M_PI_4_F* = 0.785398163f
    M_1_PI_F* = 0.318309886f
    M_2_PI_F* = 0.636619772f
    M_2_SQRTPI_F* = 1.128379167f
    M_SQRT2_F* = 1.414213562f
    M_SQRT1_2_F* = 0.707106781f
  #  #if defined( __GNUC__ )
  #  #else
  #     #define CL_HUGE_VALF     ((Float) 1e50)
  #     #define CL_HUGE_VAL      ((Double) 1e500)
  #     float nanf( const char * );
  #     #define CL_NAN           nanf( "" )
  #  #endif
  const
    MAXFLOAT* = FLT_MAX
    # INFINITY* = __builtin_huge_valf()

#  Mirror types to GL types. Mirror types allow us to avoid deciding which 87s to load based on whether we are using GL or GLES here.
type
  GlUint* = cuint
  GlInt* = cint
  GLEnum* = cuint

#
#  Vector types
#
#   Note:   OpenCL requires that all types be naturally aligned.
#           This means that vector types must be naturally aligned.
#           For example, a vector of four floats must be aligned to
#           a 16 byte boundary (calculated as 4 * the natural 4-byte
#           alignment of the float).  The alignment qualifiers here
#           will only function properly if your compiler supports them
#           and if you don't actively work to defeat them.  For example,
#           in order for a cl_float4 to be 16 byte aligned in a struct,
#           the start of the struct must itself be 16-byte aligned.
#
#           Maintaining proper alignment is the user's responsibility.
#
#  Define basic vector types

when defined(VEC):
  {.error: "Not implemented.".}
  # when not defined(clang):
  #   import
  #     altivec

    #  may be omitted depending on compiler. AltiVec spec provides no way to detect whether the header is required.
  #  typedef __vector unsigned char     HardwareDependentUchar16;
  #  typedef __vector signed char       HardwareDependentChar16;
  #  typedef __vector unsigned short    HardwareDependentUshort8;
  #  typedef __vector signed short      HardwareDependentShort8;
  #  typedef __vector unsigned int      HardwareDependentUint4;
  #  typedef __vector signed int        HardwareDependentInt4;
  #  typedef __vector float             HardwareDependentFloat4;
  # const
  #   __CL_UCHAR16__* = 1
  #   __CL_CHAR16__* = 1
  #   __CL_USHORT8__* = 1
  #   __CL_SHORT8__* = 1
  #   __CL_UINT4__* = 1
  #   __CL_INT4__* = 1
  #   __CL_FLOAT4__* = 1



when defined(SSE):
  # when defined(__MINGW64__):
  #   import
  #     intrin
  #
  # else:
  #   import
  #     xmmintrin

  # when defined(__GNUC__):
  #   ##  typedef float HardwareDependentFloat4   __attribute__((vector_size(16)));
  # else:

  import nimsimd/sse2
  export nimsimd/sse2
  type
    HardwareDependentFloat4* = M128
  # const
  #   __CL_FLOAT4__* = 1


when defined(SSE2):
  # when defined(__MINGW64__):
  #   import
  #     intrin
  #
  # else:
  #   import
  #     emmintrin

  # when defined(__GNUC__):
    #  typedef Uchar    HardwareDependentUchar16    __attribute__((vector_size(16)));
    #  typedef Char     HardwareDependentChar16     __attribute__((vector_size(16)));
    #  typedef Ushort   HardwareDependentUshort8    __attribute__((vector_size(16)));
    #  typedef Short    HardwareDependentShort8     __attribute__((vector_size(16)));
    #  typedef Uint     HardwareDependentUint4      __attribute__((vector_size(16)));
    #  typedef Int      HardwareDependentInt4       __attribute__((vector_size(16)));
    #  typedef Ulong    HardwareDependentUlong2     __attribute__((vector_size(16)));
    #  typedef Long     HardwareDependentLong2      __attribute__((vector_size(16)));
    #  typedef Double   HardwareDependentDouble2    __attribute__((vector_size(16)));
  # else:

  import nimsimd/sse2
  export nimsimd/sse2

  type
    HardwareDependentUchar16* = M128i
    HardwareDependentChar16* = M128i
    HardwareDependentUshort8* = M128i
    HardwareDependentShort8* = M128i
    HardwareDependentUint4* = M128i
    HardwareDependentInt4* = M128i
    HardwareDependentUlong2* = M128i
    HardwareDependentLong2* = M128i
    HardwareDependentDouble2* = M128d
  # const
  #   __CL_UCHAR16__* = 1
  #   __CL_CHAR16__* = 1
  #   __CL_USHORT8__* = 1
  #   __CL_SHORT8__* = 1
  #   __CL_INT4__* = 1
  #   __CL_UINT4__* = 1
  #   __CL_ULONG2__* = 1
  #   __CL_LONG2__* = 1
  #   __CL_DOUBLE2__* = 1


when defined(MMX):
  {.error: "Not implemented.".}

  # when defined(__GNUC__):
    #  typedef Uchar    HardwareDependentUchar8     __attribute__((vector_size(8)));
    #  typedef Char     HardwareDependentChar8      __attribute__((vector_size(8)));
    #  typedef Ushort   HardwareDependentUshort4    __attribute__((vector_size(8)));
    #  typedef Short    HardwareDependentShort4     __attribute__((vector_size(8)));
    #  typedef Uint     HardwareDependentUint2      __attribute__((vector_size(8)));
    #  typedef Int      HardwareDependentInt2       __attribute__((vector_size(8)));
    #  typedef Ulong    HardwareDependentUlong1     __attribute__((vector_size(8)));
    #  typedef Long     HardwareDependentLong1      __attribute__((vector_size(8)));
    #  typedef Float    HardwareDependentFloat2     __attribute__((vector_size(8)));
  # else:
  # type
  #   HardwareDependentUchar8* = __m64
  #   HardwareDependentChar8* = __m64
  #   HardwareDependentUshort4* = __m64
  #   HardwareDependentShort4* = __m64
  #   HardwareDependentUint2* = __m64
  #   HardwareDependentInt2* = __m64
  #   HardwareDependentUlong1* = __m64
  #   HardwareDependentLong1* = __m64
  #   HardwareDependentFloat2* = __m64
  # const
  #   __CL_UCHAR8__* = 1
  #   __CL_CHAR8__* = 1
  #   __CL_USHORT4__* = 1
  #   __CL_SHORT4__* = 1
  #   __CL_INT2__* = 1
  #   __CL_UINT2__* = 1
  #   __CL_ULONG1__* = 1
  #   __CL_LONG1__* = 1
  #   __CL_FLOAT2__* = 1


when defined(AVX):
  # when defined(__MINGW64__):
  #   discard
  # else:
  #   discard
  # when defined(__GNUC__):
  #   ##  typedef Float    HardwareDependentFloat8     __attribute__((vector_size(32)));
  #   ##  typedef Double   HardwareDependentDouble4    __attribute__((vector_size(32)));
  # else:

  import nimsimd/avx
  export nimsimd/avx

  type
    HardwareDependentFloat8* = M256
    HardwareDependentDouble4* = M256d
  # const
  #   __CL_FLOAT8__* = 1
  #   __CL_DOUBLE4__* = 1


#  Define capabilities for anonymous struct members.

# when not defined(__cplusplus) and defined(__STDC_VERSION__) and
#     __STDC_VERSION__ >= 201112'i32:
#   const
#     __CL_HAS_ANON_STRUCT__* = 1
#     __CL_ANON_STRUCT__* = true
# elif defined(WIN32) and defined(MSC_VER) and not defined(__STDC__):
#   const
#     __CL_HAS_ANON_STRUCT__* = 1
#     __CL_ANON_STRUCT__* = true
# elif defined(__GNUC__) and not defined(__STRICT_ANSI__):
#   const
#     __CL_HAS_ANON_STRUCT__* = 1
#     __CL_ANON_STRUCT__* = __extension__
# elif defined(clang):
#   const
#     __CL_HAS_ANON_STRUCT__* = 1
#     __CL_ANON_STRUCT__* = __extension__
# else:
#   const
#     __CL_HAS_ANON_STRUCT__* = 0
#     __CL_ANON_STRUCT__* = true
# when defined(WIN32) and defined(MSC_VER) and __CL_HAS_ANON_STRUCT__:
#  Disable warning C4201: nonstandard extension used : nameless struct/union
#  Define alignment keys
#  #if defined( __GNUC__ ) || defined(__INTEGRITY)
#      #define CL_ALIGNED(_x)          __attribute__ ((aligned(_x)))
#  #elif defined( WIN32) && (MSC_VER)
#  Alignment keys neutered on windows because MSVC can't swallow function arguments with alignment requirements
#  http://msdn.microsoft.com/en-us/library/373ak2y1%28VS.71%29.aspx
#  #include <crtdefs.h>
#  #define CL_ALIGNED(_x)          _CRT_ALIGN(_x)

#  #else
#     #warning  Need to implement some method to align data here
#     #define  CL_ALIGNED(_x)
#  #endif
#  Indicate whether .xyzw, .s0123 and .hi.lo are supported
#[
when __CL_HAS_ANON_STRUCT__:]#
#  .xyzw and .s0123...{f|F} are supported
const
  HAS_NAMED_VECTOR_FIELDS* = true
#  .hi and .lo are supported
const
  HAS_HI_LO_VECTOR_FIELDS* = true


#  Define cl_vector types
type AnonStruct0 {.packed.} = object
  x: Char
  y: Char
type AnonStruct1 {.packed.} = object
  s0: Char
  s1: Char
type AnonStruct2 {.packed.} = object
  lo: Char
  hi: Char

type Char2* {.bycopy, union.} = object
  ##[A vector of 2 'Char's.
     Can be accessed by: `x, y: Char`
     `s0, s1: Char`
     `lo, hi: Char`]##
  s*: array[2, Char]
  when defined(HardwareDependentChar2):
    v2*: HardwareDependentChar2
  anonStruct0: AnonStruct0
  anonStruct1: AnonStruct1
  anonStruct2: AnonStruct2


func x*(self: Char2): Char {.inline.} =
  self.anonStruct0.x

func `x=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct0.x = newVal

func y*(self: Char2): Char {.inline.} =
  self.anonStruct0.y

func `y=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct0.y = newVal

func s0*(self: Char2): Char {.inline.} =
  self.anonStruct1.s0

func `s0=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct1.s0 = newVal

func s1*(self: Char2): Char {.inline.} =
  self.anonStruct1.s1

func `s1=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct1.s1 = newVal

func lo*(self: Char2): Char {.inline.} =
  self.anonStruct2.lo

func `lo=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct2.lo = newVal

func hi*(self: Char2): Char {.inline.} =
  self.anonStruct2.hi

func `hi=`*(self: var Char2; newVal: Char) {.inline.} =
  self.anonStruct2.hi = newVal

type AnonStruct3 {.packed.} = object
  x: Char
  y: Char
  z: Char
  w: Char
type AnonStruct4 {.packed.} = object
  s0: Char
  s1: Char
  s2: Char
  s3: Char
type AnonStruct5 {.packed.} = object
  lo: Char2
  hi: Char2

type Char4* {.bycopy, union.} = object
  ##[A vector of 4 'Char's.
     Can be accessed by: `x, y, z, w: Char`
     `s0, s1, s2, s3: Char`
     `lo, hi: Char2`]##
  s*: array[4, Char]
  when defined(HardwareDependentChar2):
    v2*: array[2, HardwareDependentChar2]
  when defined(HardwareDependentChar4):
    v4*: HardwareDependentChar4
  anonStruct3: AnonStruct3
  anonStruct4: AnonStruct4
  anonStruct5: AnonStruct5


func x*(self: Char4): Char {.inline.} =
  self.anonStruct3.x

func `x=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct3.x = newVal

func y*(self: Char4): Char {.inline.} =
  self.anonStruct3.y

func `y=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct3.y = newVal

func z*(self: Char4): Char {.inline.} =
  self.anonStruct3.z

func `z=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct3.z = newVal

func w*(self: Char4): Char {.inline.} =
  self.anonStruct3.w

func `w=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct3.w = newVal

func s0*(self: Char4): Char {.inline.} =
  self.anonStruct4.s0

func `s0=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct4.s0 = newVal

func s1*(self: Char4): Char {.inline.} =
  self.anonStruct4.s1

func `s1=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct4.s1 = newVal

func s2*(self: Char4): Char {.inline.} =
  self.anonStruct4.s2

func `s2=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct4.s2 = newVal

func s3*(self: Char4): Char {.inline.} =
  self.anonStruct4.s3

func `s3=`*(self: var Char4; newVal: Char) {.inline.} =
  self.anonStruct4.s3 = newVal

func lo*(self: Char4): Char2 {.inline.} =
  self.anonStruct5.lo

func `lo=`*(self: var Char4; newVal: Char2) {.inline.} =
  self.anonStruct5.lo = newVal

func hi*(self: Char4): Char2 {.inline.} =
  self.anonStruct5.hi

func `hi=`*(self: var Char4; newVal: Char2) {.inline.} =
  self.anonStruct5.hi = newVal

type AnonStruct6 {.packed.} = object
  x: Char
  y: Char
  z: Char
  w: Char
type AnonStruct7 {.packed.} = object
  s0: Char
  s1: Char
  s2: Char
  s3: Char
  s4: Char
  s5: Char
  s6: Char
  s7: Char
type AnonStruct8 {.packed.} = object
  lo: Char4
  hi: Char4

type Char8* {.bycopy, union.} = object
  ##[A vector of 8 'Char's.
     Can be accessed by: `x, y, z, w: Char`
     `s0, s1, s2, s3, s4, s5, s6, s7: Char`
     `lo, hi: Char4`]##
  s*: array[8, Char]
  when defined(HardwareDependentChar2):
    v2*: array[4, HardwareDependentChar2]
  when defined(HardwareDependentChar4):
    v4*: array[2, HardwareDependentChar4]
  when defined(HardwareDependentChar8):
    v8*: HardwareDependentChar8
  anonStruct6: AnonStruct6
  anonStruct7: AnonStruct7
  anonStruct8: AnonStruct8


func x*(self: Char8): Char {.inline.} =
  self.anonStruct6.x

func `x=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct6.x = newVal

func y*(self: Char8): Char {.inline.} =
  self.anonStruct6.y

func `y=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct6.y = newVal

func z*(self: Char8): Char {.inline.} =
  self.anonStruct6.z

func `z=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct6.z = newVal

func w*(self: Char8): Char {.inline.} =
  self.anonStruct6.w

func `w=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct6.w = newVal

func s0*(self: Char8): Char {.inline.} =
  self.anonStruct7.s0

func `s0=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s0 = newVal

func s1*(self: Char8): Char {.inline.} =
  self.anonStruct7.s1

func `s1=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s1 = newVal

func s2*(self: Char8): Char {.inline.} =
  self.anonStruct7.s2

func `s2=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s2 = newVal

func s3*(self: Char8): Char {.inline.} =
  self.anonStruct7.s3

func `s3=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s3 = newVal

func s4*(self: Char8): Char {.inline.} =
  self.anonStruct7.s4

func `s4=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s4 = newVal

func s5*(self: Char8): Char {.inline.} =
  self.anonStruct7.s5

func `s5=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s5 = newVal

func s6*(self: Char8): Char {.inline.} =
  self.anonStruct7.s6

func `s6=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s6 = newVal

func s7*(self: Char8): Char {.inline.} =
  self.anonStruct7.s7

func `s7=`*(self: var Char8; newVal: Char) {.inline.} =
  self.anonStruct7.s7 = newVal

func lo*(self: Char8): Char4 {.inline.} =
  self.anonStruct8.lo

func `lo=`*(self: var Char8; newVal: Char4) {.inline.} =
  self.anonStruct8.lo = newVal

func hi*(self: Char8): Char4 {.inline.} =
  self.anonStruct8.hi

func `hi=`*(self: var Char8; newVal: Char4) {.inline.} =
  self.anonStruct8.hi = newVal

type AnonStruct9 {.packed.} = object
  x: Char
  y: Char
  z: Char
  w: Char
  spacer4: Char
  spacer5: Char
  spacer6: Char
  spacer7: Char
  spacer8: Char
  spacer9: Char
  sa: Char
  sb: Char
  sc: Char
  sd: Char
  se: Char
  sf: Char
type AnonStruct10 {.packed.} = object
  s0: Char
  s1: Char
  s2: Char
  s3: Char
  s4: Char
  s5: Char
  s6: Char
  s7: Char
  s8: Char
  s9: Char
  sAA: Char
  sBB: Char
  sCC: Char
  sDD: Char
  sEE: Char
  sFF: Char
type AnonStruct11 {.packed.} = object
  lo: Char8
  hi: Char8

type Char16* {.bycopy, union.} = object
  ##[A vector of 16 'Char's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Char`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Char`
     `lo, hi: Char8`]##
  s*: array[16, Char]
  when defined(HardwareDependentChar2):
    v2*: array[8, HardwareDependentChar2]
  when defined(HardwareDependentChar4):
    v4*: array[4, HardwareDependentChar4]
  when defined(HardwareDependentChar8):
    v8*: array[2, HardwareDependentChar8]
  when defined(HardwareDependentChar16):
    v16*: HardwareDependentChar16
  anonStruct9: AnonStruct9
  anonStruct10: AnonStruct10
  anonStruct11: AnonStruct11


func x*(self: Char16): Char {.inline.} =
  self.anonStruct9.x

func `x=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.x = newVal

func y*(self: Char16): Char {.inline.} =
  self.anonStruct9.y

func `y=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.y = newVal

func z*(self: Char16): Char {.inline.} =
  self.anonStruct9.z

func `z=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.z = newVal

func w*(self: Char16): Char {.inline.} =
  self.anonStruct9.w

func `w=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.w = newVal

func spacer4*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer4

func `spacer4=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer4 = newVal

func spacer5*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer5

func `spacer5=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer5 = newVal

func spacer6*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer6

func `spacer6=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer6 = newVal

func spacer7*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer7

func `spacer7=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer7 = newVal

func spacer8*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer8

func `spacer8=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer8 = newVal

func spacer9*(self: Char16): Char {.inline.} =
  self.anonStruct9.spacer9

func `spacer9=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.spacer9 = newVal

func sa*(self: Char16): Char {.inline.} =
  self.anonStruct9.sa

func `sa=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.sa = newVal

func sb*(self: Char16): Char {.inline.} =
  self.anonStruct9.sb

func `sb=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.sb = newVal

func sc*(self: Char16): Char {.inline.} =
  self.anonStruct9.sc

func `sc=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.sc = newVal

func sd*(self: Char16): Char {.inline.} =
  self.anonStruct9.sd

func `sd=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.sd = newVal

func se*(self: Char16): Char {.inline.} =
  self.anonStruct9.se

func `se=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.se = newVal

func sf*(self: Char16): Char {.inline.} =
  self.anonStruct9.sf

func `sf=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct9.sf = newVal

func s0*(self: Char16): Char {.inline.} =
  self.anonStruct10.s0

func `s0=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s0 = newVal

func s1*(self: Char16): Char {.inline.} =
  self.anonStruct10.s1

func `s1=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s1 = newVal

func s2*(self: Char16): Char {.inline.} =
  self.anonStruct10.s2

func `s2=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s2 = newVal

func s3*(self: Char16): Char {.inline.} =
  self.anonStruct10.s3

func `s3=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s3 = newVal

func s4*(self: Char16): Char {.inline.} =
  self.anonStruct10.s4

func `s4=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s4 = newVal

func s5*(self: Char16): Char {.inline.} =
  self.anonStruct10.s5

func `s5=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s5 = newVal

func s6*(self: Char16): Char {.inline.} =
  self.anonStruct10.s6

func `s6=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s6 = newVal

func s7*(self: Char16): Char {.inline.} =
  self.anonStruct10.s7

func `s7=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s7 = newVal

func s8*(self: Char16): Char {.inline.} =
  self.anonStruct10.s8

func `s8=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s8 = newVal

func s9*(self: Char16): Char {.inline.} =
  self.anonStruct10.s9

func `s9=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.s9 = newVal

func sAA*(self: Char16): Char {.inline.} =
  self.anonStruct10.sAA

func `sAA=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sAA = newVal

func sBB*(self: Char16): Char {.inline.} =
  self.anonStruct10.sBB

func `sBB=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sBB = newVal

func sCC*(self: Char16): Char {.inline.} =
  self.anonStruct10.sCC

func `sCC=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sCC = newVal

func sDD*(self: Char16): Char {.inline.} =
  self.anonStruct10.sDD

func `sDD=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sDD = newVal

func sEE*(self: Char16): Char {.inline.} =
  self.anonStruct10.sEE

func `sEE=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sEE = newVal

func sFF*(self: Char16): Char {.inline.} =
  self.anonStruct10.sFF

func `sFF=`*(self: var Char16; newVal: Char) {.inline.} =
  self.anonStruct10.sFF = newVal

func lo*(self: Char16): Char8 {.inline.} =
  self.anonStruct11.lo

func `lo=`*(self: var Char16; newVal: Char8) {.inline.} =
  self.anonStruct11.lo = newVal

func hi*(self: Char16): Char8 {.inline.} =
  self.anonStruct11.hi

func `hi=`*(self: var Char16; newVal: Char8) {.inline.} =
  self.anonStruct11.hi = newVal

type AnonStruct12 {.packed.} = object
  x: Uchar
  y: Uchar
type AnonStruct13 {.packed.} = object
  s0: Uchar
  s1: Uchar
type AnonStruct14 {.packed.} = object
  lo: Uchar
  hi: Uchar

type Uchar2* {.bycopy, union.} = object
  ##[A vector of 2 'Uchar's.
     Can be accessed by: `x, y: Uchar`
     `s0, s1: Uchar`
     `lo, hi: Uchar`]##
  s*: array[2, Uchar]
  when defined(HardwareDependentUchar2):
    v2*: HardwareDependentUchar2
  anonStruct12: AnonStruct12
  anonStruct13: AnonStruct13
  anonStruct14: AnonStruct14


func x*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct12.x

func `x=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct12.x = newVal

func y*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct12.y

func `y=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct12.y = newVal

func s0*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct13.s0

func `s0=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct13.s0 = newVal

func s1*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct13.s1

func `s1=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct13.s1 = newVal

func lo*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct14.lo

func `lo=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct14.lo = newVal

func hi*(self: Uchar2): Uchar {.inline.} =
  self.anonStruct14.hi

func `hi=`*(self: var Uchar2; newVal: Uchar) {.inline.} =
  self.anonStruct14.hi = newVal

type AnonStruct15 {.packed.} = object
  x: Uchar
  y: Uchar
  z: Uchar
  w: Uchar
type AnonStruct16 {.packed.} = object
  s0: Uchar
  s1: Uchar
  s2: Uchar
  s3: Uchar
type AnonStruct17 {.packed.} = object
  lo: Uchar2
  hi: Uchar2

type Uchar4* {.bycopy, union.} = object
  ##[A vector of 4 'Uchar's.
     Can be accessed by: `x, y, z, w: Uchar`
     `s0, s1, s2, s3: Uchar`
     `lo, hi: Uchar2`]##
  s*: array[4, Uchar]
  when defined(HardwareDependentUchar2):
    v2*: array[2, HardwareDependentUchar2]
  when defined(HardwareDependentUchar4):
    v4*: HardwareDependentUchar4
  anonStruct15: AnonStruct15
  anonStruct16: AnonStruct16
  anonStruct17: AnonStruct17


func x*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct15.x

func `x=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct15.x = newVal

func y*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct15.y

func `y=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct15.y = newVal

func z*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct15.z

func `z=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct15.z = newVal

func w*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct15.w

func `w=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct15.w = newVal

func s0*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct16.s0

func `s0=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct16.s0 = newVal

func s1*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct16.s1

func `s1=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct16.s1 = newVal

func s2*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct16.s2

func `s2=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct16.s2 = newVal

func s3*(self: Uchar4): Uchar {.inline.} =
  self.anonStruct16.s3

func `s3=`*(self: var Uchar4; newVal: Uchar) {.inline.} =
  self.anonStruct16.s3 = newVal

func lo*(self: Uchar4): Uchar2 {.inline.} =
  self.anonStruct17.lo

func `lo=`*(self: var Uchar4; newVal: Uchar2) {.inline.} =
  self.anonStruct17.lo = newVal

func hi*(self: Uchar4): Uchar2 {.inline.} =
  self.anonStruct17.hi

func `hi=`*(self: var Uchar4; newVal: Uchar2) {.inline.} =
  self.anonStruct17.hi = newVal

type AnonStruct18 {.packed.} = object
  x: Uchar
  y: Uchar
  z: Uchar
  w: Uchar
type AnonStruct19 {.packed.} = object
  s0: Uchar
  s1: Uchar
  s2: Uchar
  s3: Uchar
  s4: Uchar
  s5: Uchar
  s6: Uchar
  s7: Uchar
type AnonStruct20 {.packed.} = object
  lo: Uchar4
  hi: Uchar4

type Uchar8* {.bycopy, union.} = object
  ##[A vector of 8 'Uchar's.
     Can be accessed by: `x, y, z, w: Uchar`
     `s0, s1, s2, s3, s4, s5, s6, s7: Uchar`
     `lo, hi: Uchar4`]##
  s*: array[8, Uchar]
  when defined(HardwareDependentUchar2):
    v2*: array[4, HardwareDependentUchar2]
  when defined(HardwareDependentUchar4):
    v4*: array[2, HardwareDependentUchar4]
  when defined(HardwareDependentUchar8):
    v8*: HardwareDependentUchar8
  anonStruct18: AnonStruct18
  anonStruct19: AnonStruct19
  anonStruct20: AnonStruct20


func x*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct18.x

func `x=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct18.x = newVal

func y*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct18.y

func `y=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct18.y = newVal

func z*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct18.z

func `z=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct18.z = newVal

func w*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct18.w

func `w=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct18.w = newVal

func s0*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s0

func `s0=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s0 = newVal

func s1*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s1

func `s1=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s1 = newVal

func s2*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s2

func `s2=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s2 = newVal

func s3*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s3

func `s3=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s3 = newVal

func s4*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s4

func `s4=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s4 = newVal

func s5*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s5

func `s5=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s5 = newVal

func s6*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s6

func `s6=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s6 = newVal

func s7*(self: Uchar8): Uchar {.inline.} =
  self.anonStruct19.s7

func `s7=`*(self: var Uchar8; newVal: Uchar) {.inline.} =
  self.anonStruct19.s7 = newVal

func lo*(self: Uchar8): Uchar4 {.inline.} =
  self.anonStruct20.lo

func `lo=`*(self: var Uchar8; newVal: Uchar4) {.inline.} =
  self.anonStruct20.lo = newVal

func hi*(self: Uchar8): Uchar4 {.inline.} =
  self.anonStruct20.hi

func `hi=`*(self: var Uchar8; newVal: Uchar4) {.inline.} =
  self.anonStruct20.hi = newVal

type AnonStruct21 {.packed.} = object
  x: Uchar
  y: Uchar
  z: Uchar
  w: Uchar
  spacer4: Uchar
  spacer5: Uchar
  spacer6: Uchar
  spacer7: Uchar
  spacer8: Uchar
  spacer9: Uchar
  sa: Uchar
  sb: Uchar
  sc: Uchar
  sd: Uchar
  se: Uchar
  sf: Uchar
type AnonStruct22 {.packed.} = object
  s0: Uchar
  s1: Uchar
  s2: Uchar
  s3: Uchar
  s4: Uchar
  s5: Uchar
  s6: Uchar
  s7: Uchar
  s8: Uchar
  s9: Uchar
  sAA: Uchar
  sBB: Uchar
  sCC: Uchar
  sDD: Uchar
  sEE: Uchar
  sFF: Uchar
type AnonStruct23 {.packed.} = object
  lo: Uchar8
  hi: Uchar8

type Uchar16* {.bycopy, union.} = object
  ##[A vector of 16 'Uchar's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Uchar`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Uchar`
     `lo, hi: Uchar8`]##
  s*: array[16, Uchar]
  when defined(HardwareDependentUchar2):
    v2*: array[8, HardwareDependentUchar2]
  when defined(HardwareDependentUchar4):
    v4*: array[4, HardwareDependentUchar4]
  when defined(HardwareDependentUchar8):
    v8*: array[2, HardwareDependentUchar8]
  when defined(HardwareDependentUchar16):
    v16*: HardwareDependentUchar16
  anonStruct21: AnonStruct21
  anonStruct22: AnonStruct22
  anonStruct23: AnonStruct23


func x*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.x

func `x=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.x = newVal

func y*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.y

func `y=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.y = newVal

func z*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.z

func `z=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.z = newVal

func w*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.w

func `w=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.w = newVal

func spacer4*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer4

func `spacer4=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer4 = newVal

func spacer5*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer5

func `spacer5=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer5 = newVal

func spacer6*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer6

func `spacer6=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer6 = newVal

func spacer7*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer7

func `spacer7=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer7 = newVal

func spacer8*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer8

func `spacer8=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer8 = newVal

func spacer9*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.spacer9

func `spacer9=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.spacer9 = newVal

func sa*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.sa

func `sa=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.sa = newVal

func sb*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.sb

func `sb=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.sb = newVal

func sc*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.sc

func `sc=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.sc = newVal

func sd*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.sd

func `sd=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.sd = newVal

func se*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.se

func `se=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.se = newVal

func sf*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct21.sf

func `sf=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct21.sf = newVal

func s0*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s0

func `s0=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s0 = newVal

func s1*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s1

func `s1=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s1 = newVal

func s2*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s2

func `s2=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s2 = newVal

func s3*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s3

func `s3=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s3 = newVal

func s4*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s4

func `s4=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s4 = newVal

func s5*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s5

func `s5=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s5 = newVal

func s6*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s6

func `s6=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s6 = newVal

func s7*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s7

func `s7=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s7 = newVal

func s8*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s8

func `s8=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s8 = newVal

func s9*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.s9

func `s9=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.s9 = newVal

func sAA*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sAA

func `sAA=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sAA = newVal

func sBB*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sBB

func `sBB=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sBB = newVal

func sCC*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sCC

func `sCC=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sCC = newVal

func sDD*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sDD

func `sDD=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sDD = newVal

func sEE*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sEE

func `sEE=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sEE = newVal

func sFF*(self: Uchar16): Uchar {.inline.} =
  self.anonStruct22.sFF

func `sFF=`*(self: var Uchar16; newVal: Uchar) {.inline.} =
  self.anonStruct22.sFF = newVal

func lo*(self: Uchar16): Uchar8 {.inline.} =
  self.anonStruct23.lo

func `lo=`*(self: var Uchar16; newVal: Uchar8) {.inline.} =
  self.anonStruct23.lo = newVal

func hi*(self: Uchar16): Uchar8 {.inline.} =
  self.anonStruct23.hi

func `hi=`*(self: var Uchar16; newVal: Uchar8) {.inline.} =
  self.anonStruct23.hi = newVal

type AnonStruct24 {.packed.} = object
  x: Short
  y: Short
type AnonStruct25 {.packed.} = object
  s0: Short
  s1: Short
type AnonStruct26 {.packed.} = object
  lo: Short
  hi: Short

type Short2* {.bycopy, union.} = object
  ##[A vector of 2 'Short's.
     Can be accessed by: `x, y: Short`
     `s0, s1: Short`
     `lo, hi: Short`]##
  s*: array[2, Short]
  when defined(HardwareDependentShort2):
    v2*: HardwareDependentShort2
  anonStruct24: AnonStruct24
  anonStruct25: AnonStruct25
  anonStruct26: AnonStruct26


func x*(self: Short2): Short {.inline.} =
  self.anonStruct24.x

func `x=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct24.x = newVal

func y*(self: Short2): Short {.inline.} =
  self.anonStruct24.y

func `y=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct24.y = newVal

func s0*(self: Short2): Short {.inline.} =
  self.anonStruct25.s0

func `s0=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct25.s0 = newVal

func s1*(self: Short2): Short {.inline.} =
  self.anonStruct25.s1

func `s1=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct25.s1 = newVal

func lo*(self: Short2): Short {.inline.} =
  self.anonStruct26.lo

func `lo=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct26.lo = newVal

func hi*(self: Short2): Short {.inline.} =
  self.anonStruct26.hi

func `hi=`*(self: var Short2; newVal: Short) {.inline.} =
  self.anonStruct26.hi = newVal

type AnonStruct27 {.packed.} = object
  x: Short
  y: Short
  z: Short
  w: Short
type AnonStruct28 {.packed.} = object
  s0: Short
  s1: Short
  s2: Short
  s3: Short
type AnonStruct29 {.packed.} = object
  lo: Short2
  hi: Short2

type Short4* {.bycopy, union.} = object
  ##[A vector of 4 'Short's.
     Can be accessed by: `x, y, z, w: Short`
     `s0, s1, s2, s3: Short`
     `lo, hi: Short2`]##
  s*: array[4, Short]
  when defined(HardwareDependentShort2):
    v2*: array[2, HardwareDependentShort2]
  when defined(HardwareDependentShort4):
    v4*: HardwareDependentShort4
  anonStruct27: AnonStruct27
  anonStruct28: AnonStruct28
  anonStruct29: AnonStruct29


func x*(self: Short4): Short {.inline.} =
  self.anonStruct27.x

func `x=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct27.x = newVal

func y*(self: Short4): Short {.inline.} =
  self.anonStruct27.y

func `y=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct27.y = newVal

func z*(self: Short4): Short {.inline.} =
  self.anonStruct27.z

func `z=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct27.z = newVal

func w*(self: Short4): Short {.inline.} =
  self.anonStruct27.w

func `w=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct27.w = newVal

func s0*(self: Short4): Short {.inline.} =
  self.anonStruct28.s0

func `s0=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct28.s0 = newVal

func s1*(self: Short4): Short {.inline.} =
  self.anonStruct28.s1

func `s1=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct28.s1 = newVal

func s2*(self: Short4): Short {.inline.} =
  self.anonStruct28.s2

func `s2=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct28.s2 = newVal

func s3*(self: Short4): Short {.inline.} =
  self.anonStruct28.s3

func `s3=`*(self: var Short4; newVal: Short) {.inline.} =
  self.anonStruct28.s3 = newVal

func lo*(self: Short4): Short2 {.inline.} =
  self.anonStruct29.lo

func `lo=`*(self: var Short4; newVal: Short2) {.inline.} =
  self.anonStruct29.lo = newVal

func hi*(self: Short4): Short2 {.inline.} =
  self.anonStruct29.hi

func `hi=`*(self: var Short4; newVal: Short2) {.inline.} =
  self.anonStruct29.hi = newVal

type AnonStruct30 {.packed.} = object
  x: Short
  y: Short
  z: Short
  w: Short
type AnonStruct31 {.packed.} = object
  s0: Short
  s1: Short
  s2: Short
  s3: Short
  s4: Short
  s5: Short
  s6: Short
  s7: Short
type AnonStruct32 {.packed.} = object
  lo: Short4
  hi: Short4

type Short8* {.bycopy, union.} = object
  ##[A vector of 8 'Short's.
     Can be accessed by: `x, y, z, w: Short`
     `s0, s1, s2, s3, s4, s5, s6, s7: Short`
     `lo, hi: Short4`]##
  s*: array[8, Short]
  when defined(HardwareDependentShort2):
    v2*: array[4, HardwareDependentShort2]
  when defined(HardwareDependentShort4):
    v4*: array[2, HardwareDependentShort4]
  when defined(HardwareDependentShort8):
    v8*: HardwareDependentShort8
  anonStruct30: AnonStruct30
  anonStruct31: AnonStruct31
  anonStruct32: AnonStruct32


func x*(self: Short8): Short {.inline.} =
  self.anonStruct30.x

func `x=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct30.x = newVal

func y*(self: Short8): Short {.inline.} =
  self.anonStruct30.y

func `y=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct30.y = newVal

func z*(self: Short8): Short {.inline.} =
  self.anonStruct30.z

func `z=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct30.z = newVal

func w*(self: Short8): Short {.inline.} =
  self.anonStruct30.w

func `w=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct30.w = newVal

func s0*(self: Short8): Short {.inline.} =
  self.anonStruct31.s0

func `s0=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s0 = newVal

func s1*(self: Short8): Short {.inline.} =
  self.anonStruct31.s1

func `s1=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s1 = newVal

func s2*(self: Short8): Short {.inline.} =
  self.anonStruct31.s2

func `s2=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s2 = newVal

func s3*(self: Short8): Short {.inline.} =
  self.anonStruct31.s3

func `s3=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s3 = newVal

func s4*(self: Short8): Short {.inline.} =
  self.anonStruct31.s4

func `s4=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s4 = newVal

func s5*(self: Short8): Short {.inline.} =
  self.anonStruct31.s5

func `s5=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s5 = newVal

func s6*(self: Short8): Short {.inline.} =
  self.anonStruct31.s6

func `s6=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s6 = newVal

func s7*(self: Short8): Short {.inline.} =
  self.anonStruct31.s7

func `s7=`*(self: var Short8; newVal: Short) {.inline.} =
  self.anonStruct31.s7 = newVal

func lo*(self: Short8): Short4 {.inline.} =
  self.anonStruct32.lo

func `lo=`*(self: var Short8; newVal: Short4) {.inline.} =
  self.anonStruct32.lo = newVal

func hi*(self: Short8): Short4 {.inline.} =
  self.anonStruct32.hi

func `hi=`*(self: var Short8; newVal: Short4) {.inline.} =
  self.anonStruct32.hi = newVal

type AnonStruct33 {.packed.} = object
  x: Short
  y: Short
  z: Short
  w: Short
  spacer4: Short
  spacer5: Short
  spacer6: Short
  spacer7: Short
  spacer8: Short
  spacer9: Short
  sa: Short
  sb: Short
  sc: Short
  sd: Short
  se: Short
  sf: Short
type AnonStruct34 {.packed.} = object
  s0: Short
  s1: Short
  s2: Short
  s3: Short
  s4: Short
  s5: Short
  s6: Short
  s7: Short
  s8: Short
  s9: Short
  sAA: Short
  sBB: Short
  sCC: Short
  sDD: Short
  sEE: Short
  sFF: Short
type AnonStruct35 {.packed.} = object
  lo: Short8
  hi: Short8

type Short16* {.bycopy, union.} = object
  ##[A vector of 16 'Short's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Short`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Short`
     `lo, hi: Short8`]##
  s*: array[16, Short]
  when defined(HardwareDependentShort2):
    v2*: array[8, HardwareDependentShort2]
  when defined(HardwareDependentShort4):
    v4*: array[4, HardwareDependentShort4]
  when defined(HardwareDependentShort8):
    v8*: array[2, HardwareDependentShort8]
  when defined(HardwareDependentShort16):
    v16*: HardwareDependentShort16
  anonStruct33: AnonStruct33
  anonStruct34: AnonStruct34
  anonStruct35: AnonStruct35


func x*(self: Short16): Short {.inline.} =
  self.anonStruct33.x

func `x=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.x = newVal

func y*(self: Short16): Short {.inline.} =
  self.anonStruct33.y

func `y=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.y = newVal

func z*(self: Short16): Short {.inline.} =
  self.anonStruct33.z

func `z=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.z = newVal

func w*(self: Short16): Short {.inline.} =
  self.anonStruct33.w

func `w=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.w = newVal

func spacer4*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer4

func `spacer4=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer4 = newVal

func spacer5*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer5

func `spacer5=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer5 = newVal

func spacer6*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer6

func `spacer6=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer6 = newVal

func spacer7*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer7

func `spacer7=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer7 = newVal

func spacer8*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer8

func `spacer8=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer8 = newVal

func spacer9*(self: Short16): Short {.inline.} =
  self.anonStruct33.spacer9

func `spacer9=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.spacer9 = newVal

func sa*(self: Short16): Short {.inline.} =
  self.anonStruct33.sa

func `sa=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.sa = newVal

func sb*(self: Short16): Short {.inline.} =
  self.anonStruct33.sb

func `sb=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.sb = newVal

func sc*(self: Short16): Short {.inline.} =
  self.anonStruct33.sc

func `sc=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.sc = newVal

func sd*(self: Short16): Short {.inline.} =
  self.anonStruct33.sd

func `sd=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.sd = newVal

func se*(self: Short16): Short {.inline.} =
  self.anonStruct33.se

func `se=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.se = newVal

func sf*(self: Short16): Short {.inline.} =
  self.anonStruct33.sf

func `sf=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct33.sf = newVal

func s0*(self: Short16): Short {.inline.} =
  self.anonStruct34.s0

func `s0=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s0 = newVal

func s1*(self: Short16): Short {.inline.} =
  self.anonStruct34.s1

func `s1=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s1 = newVal

func s2*(self: Short16): Short {.inline.} =
  self.anonStruct34.s2

func `s2=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s2 = newVal

func s3*(self: Short16): Short {.inline.} =
  self.anonStruct34.s3

func `s3=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s3 = newVal

func s4*(self: Short16): Short {.inline.} =
  self.anonStruct34.s4

func `s4=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s4 = newVal

func s5*(self: Short16): Short {.inline.} =
  self.anonStruct34.s5

func `s5=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s5 = newVal

func s6*(self: Short16): Short {.inline.} =
  self.anonStruct34.s6

func `s6=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s6 = newVal

func s7*(self: Short16): Short {.inline.} =
  self.anonStruct34.s7

func `s7=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s7 = newVal

func s8*(self: Short16): Short {.inline.} =
  self.anonStruct34.s8

func `s8=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s8 = newVal

func s9*(self: Short16): Short {.inline.} =
  self.anonStruct34.s9

func `s9=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.s9 = newVal

func sAA*(self: Short16): Short {.inline.} =
  self.anonStruct34.sAA

func `sAA=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sAA = newVal

func sBB*(self: Short16): Short {.inline.} =
  self.anonStruct34.sBB

func `sBB=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sBB = newVal

func sCC*(self: Short16): Short {.inline.} =
  self.anonStruct34.sCC

func `sCC=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sCC = newVal

func sDD*(self: Short16): Short {.inline.} =
  self.anonStruct34.sDD

func `sDD=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sDD = newVal

func sEE*(self: Short16): Short {.inline.} =
  self.anonStruct34.sEE

func `sEE=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sEE = newVal

func sFF*(self: Short16): Short {.inline.} =
  self.anonStruct34.sFF

func `sFF=`*(self: var Short16; newVal: Short) {.inline.} =
  self.anonStruct34.sFF = newVal

func lo*(self: Short16): Short8 {.inline.} =
  self.anonStruct35.lo

func `lo=`*(self: var Short16; newVal: Short8) {.inline.} =
  self.anonStruct35.lo = newVal

func hi*(self: Short16): Short8 {.inline.} =
  self.anonStruct35.hi

func `hi=`*(self: var Short16; newVal: Short8) {.inline.} =
  self.anonStruct35.hi = newVal

type AnonStruct36 {.packed.} = object
  x: Ushort
  y: Ushort
type AnonStruct37 {.packed.} = object
  s0: Ushort
  s1: Ushort
type AnonStruct38 {.packed.} = object
  lo: Ushort
  hi: Ushort

type Ushort2* {.bycopy, union.} = object
  ##[A vector of 2 'Ushort's.
     Can be accessed by: `x, y: Ushort`
     `s0, s1: Ushort`
     `lo, hi: Ushort`]##
  s*: array[2, Ushort]
  when defined(HardwareDependentUshort2):
    v2*: HardwareDependentUshort2
  anonStruct36: AnonStruct36
  anonStruct37: AnonStruct37
  anonStruct38: AnonStruct38


func x*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct36.x

func `x=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct36.x = newVal

func y*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct36.y

func `y=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct36.y = newVal

func s0*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct37.s0

func `s0=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct37.s0 = newVal

func s1*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct37.s1

func `s1=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct37.s1 = newVal

func lo*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct38.lo

func `lo=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct38.lo = newVal

func hi*(self: Ushort2): Ushort {.inline.} =
  self.anonStruct38.hi

func `hi=`*(self: var Ushort2; newVal: Ushort) {.inline.} =
  self.anonStruct38.hi = newVal

type AnonStruct39 {.packed.} = object
  x: Ushort
  y: Ushort
  z: Ushort
  w: Ushort
type AnonStruct40 {.packed.} = object
  s0: Ushort
  s1: Ushort
  s2: Ushort
  s3: Ushort
type AnonStruct41 {.packed.} = object
  lo: Ushort2
  hi: Ushort2

type Ushort4* {.bycopy, union.} = object
  ##[A vector of 4 'Ushort's.
     Can be accessed by: `x, y, z, w: Ushort`
     `s0, s1, s2, s3: Ushort`
     `lo, hi: Ushort2`]##
  s*: array[4, Ushort]
  when defined(HardwareDependentUshort2):
    v2*: array[2, HardwareDependentUshort2]
  when defined(HardwareDependentUshort4):
    v4*: HardwareDependentUshort4
  anonStruct39: AnonStruct39
  anonStruct40: AnonStruct40
  anonStruct41: AnonStruct41


func x*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct39.x

func `x=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct39.x = newVal

func y*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct39.y

func `y=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct39.y = newVal

func z*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct39.z

func `z=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct39.z = newVal

func w*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct39.w

func `w=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct39.w = newVal

func s0*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct40.s0

func `s0=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct40.s0 = newVal

func s1*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct40.s1

func `s1=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct40.s1 = newVal

func s2*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct40.s2

func `s2=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct40.s2 = newVal

func s3*(self: Ushort4): Ushort {.inline.} =
  self.anonStruct40.s3

func `s3=`*(self: var Ushort4; newVal: Ushort) {.inline.} =
  self.anonStruct40.s3 = newVal

func lo*(self: Ushort4): Ushort2 {.inline.} =
  self.anonStruct41.lo

func `lo=`*(self: var Ushort4; newVal: Ushort2) {.inline.} =
  self.anonStruct41.lo = newVal

func hi*(self: Ushort4): Ushort2 {.inline.} =
  self.anonStruct41.hi

func `hi=`*(self: var Ushort4; newVal: Ushort2) {.inline.} =
  self.anonStruct41.hi = newVal

type AnonStruct42 {.packed.} = object
  x: Ushort
  y: Ushort
  z: Ushort
  w: Ushort
type AnonStruct43 {.packed.} = object
  s0: Ushort
  s1: Ushort
  s2: Ushort
  s3: Ushort
  s4: Ushort
  s5: Ushort
  s6: Ushort
  s7: Ushort
type AnonStruct44 {.packed.} = object
  lo: Ushort4
  hi: Ushort4

type Ushort8* {.bycopy, union.} = object
  ##[A vector of 8 'Ushort's.
     Can be accessed by: `x, y, z, w: Ushort`
     `s0, s1, s2, s3, s4, s5, s6, s7: Ushort`
     `lo, hi: Ushort4`]##
  s*: array[8, Ushort]
  when defined(HardwareDependentUshort2):
    v2*: array[4, HardwareDependentUshort2]
  when defined(HardwareDependentUshort4):
    v4*: array[2, HardwareDependentUshort4]
  when defined(HardwareDependentUshort8):
    v8*: HardwareDependentUshort8
  anonStruct42: AnonStruct42
  anonStruct43: AnonStruct43
  anonStruct44: AnonStruct44


func x*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct42.x

func `x=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct42.x = newVal

func y*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct42.y

func `y=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct42.y = newVal

func z*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct42.z

func `z=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct42.z = newVal

func w*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct42.w

func `w=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct42.w = newVal

func s0*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s0

func `s0=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s0 = newVal

func s1*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s1

func `s1=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s1 = newVal

func s2*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s2

func `s2=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s2 = newVal

func s3*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s3

func `s3=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s3 = newVal

func s4*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s4

func `s4=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s4 = newVal

func s5*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s5

func `s5=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s5 = newVal

func s6*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s6

func `s6=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s6 = newVal

func s7*(self: Ushort8): Ushort {.inline.} =
  self.anonStruct43.s7

func `s7=`*(self: var Ushort8; newVal: Ushort) {.inline.} =
  self.anonStruct43.s7 = newVal

func lo*(self: Ushort8): Ushort4 {.inline.} =
  self.anonStruct44.lo

func `lo=`*(self: var Ushort8; newVal: Ushort4) {.inline.} =
  self.anonStruct44.lo = newVal

func hi*(self: Ushort8): Ushort4 {.inline.} =
  self.anonStruct44.hi

func `hi=`*(self: var Ushort8; newVal: Ushort4) {.inline.} =
  self.anonStruct44.hi = newVal

type AnonStruct45 {.packed.} = object
  x: Ushort
  y: Ushort
  z: Ushort
  w: Ushort
  spacer4: Ushort
  spacer5: Ushort
  spacer6: Ushort
  spacer7: Ushort
  spacer8: Ushort
  spacer9: Ushort
  sa: Ushort
  sb: Ushort
  sc: Ushort
  sd: Ushort
  se: Ushort
  sf: Ushort
type AnonStruct46 {.packed.} = object
  s0: Ushort
  s1: Ushort
  s2: Ushort
  s3: Ushort
  s4: Ushort
  s5: Ushort
  s6: Ushort
  s7: Ushort
  s8: Ushort
  s9: Ushort
  sAA: Ushort
  sBB: Ushort
  sCC: Ushort
  sDD: Ushort
  sEE: Ushort
  sFF: Ushort
type AnonStruct47 {.packed.} = object
  lo: Ushort8
  hi: Ushort8

type Ushort16* {.bycopy, union.} = object
  ##[A vector of 16 'Ushort's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Ushort`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Ushort`
     `lo, hi: Ushort8`]##
  s*: array[16, Ushort]
  when defined(HardwareDependentUshort2):
    v2*: array[8, HardwareDependentUshort2]
  when defined(HardwareDependentUshort4):
    v4*: array[4, HardwareDependentUshort4]
  when defined(HardwareDependentUshort8):
    v8*: array[2, HardwareDependentUshort8]
  when defined(HardwareDependentUshort16):
    v16*: HardwareDependentUshort16
  anonStruct45: AnonStruct45
  anonStruct46: AnonStruct46
  anonStruct47: AnonStruct47


func x*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.x

func `x=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.x = newVal

func y*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.y

func `y=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.y = newVal

func z*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.z

func `z=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.z = newVal

func w*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.w

func `w=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.w = newVal

func spacer4*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer4

func `spacer4=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer4 = newVal

func spacer5*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer5

func `spacer5=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer5 = newVal

func spacer6*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer6

func `spacer6=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer6 = newVal

func spacer7*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer7

func `spacer7=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer7 = newVal

func spacer8*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer8

func `spacer8=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer8 = newVal

func spacer9*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.spacer9

func `spacer9=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.spacer9 = newVal

func sa*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.sa

func `sa=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.sa = newVal

func sb*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.sb

func `sb=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.sb = newVal

func sc*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.sc

func `sc=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.sc = newVal

func sd*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.sd

func `sd=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.sd = newVal

func se*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.se

func `se=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.se = newVal

func sf*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct45.sf

func `sf=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct45.sf = newVal

func s0*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s0

func `s0=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s0 = newVal

func s1*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s1

func `s1=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s1 = newVal

func s2*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s2

func `s2=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s2 = newVal

func s3*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s3

func `s3=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s3 = newVal

func s4*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s4

func `s4=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s4 = newVal

func s5*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s5

func `s5=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s5 = newVal

func s6*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s6

func `s6=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s6 = newVal

func s7*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s7

func `s7=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s7 = newVal

func s8*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s8

func `s8=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s8 = newVal

func s9*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.s9

func `s9=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.s9 = newVal

func sAA*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sAA

func `sAA=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sAA = newVal

func sBB*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sBB

func `sBB=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sBB = newVal

func sCC*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sCC

func `sCC=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sCC = newVal

func sDD*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sDD

func `sDD=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sDD = newVal

func sEE*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sEE

func `sEE=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sEE = newVal

func sFF*(self: Ushort16): Ushort {.inline.} =
  self.anonStruct46.sFF

func `sFF=`*(self: var Ushort16; newVal: Ushort) {.inline.} =
  self.anonStruct46.sFF = newVal

func lo*(self: Ushort16): Ushort8 {.inline.} =
  self.anonStruct47.lo

func `lo=`*(self: var Ushort16; newVal: Ushort8) {.inline.} =
  self.anonStruct47.lo = newVal

func hi*(self: Ushort16): Ushort8 {.inline.} =
  self.anonStruct47.hi

func `hi=`*(self: var Ushort16; newVal: Ushort8) {.inline.} =
  self.anonStruct47.hi = newVal

type AnonStruct48 {.packed.} = object
  x: Half
  y: Half
type AnonStruct49 {.packed.} = object
  s0: Half
  s1: Half
type AnonStruct50 {.packed.} = object
  lo: Half
  hi: Half

type Half2* {.bycopy, union.} = object
  ##[A vector of 2 'Half's.
     Can be accessed by: `x, y: Half`
     `s0, s1: Half`
     `lo, hi: Half`]##
  s*: array[2, Half]
  when defined(HardwareDependentHalf2):
    v2*: HardwareDependentHalf2
  anonStruct48: AnonStruct48
  anonStruct49: AnonStruct49
  anonStruct50: AnonStruct50


func x*(self: Half2): Half {.inline.} =
  self.anonStruct48.x

func `x=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct48.x = newVal

func y*(self: Half2): Half {.inline.} =
  self.anonStruct48.y

func `y=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct48.y = newVal

func s0*(self: Half2): Half {.inline.} =
  self.anonStruct49.s0

func `s0=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct49.s0 = newVal

func s1*(self: Half2): Half {.inline.} =
  self.anonStruct49.s1

func `s1=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct49.s1 = newVal

func lo*(self: Half2): Half {.inline.} =
  self.anonStruct50.lo

func `lo=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct50.lo = newVal

func hi*(self: Half2): Half {.inline.} =
  self.anonStruct50.hi

func `hi=`*(self: var Half2; newVal: Half) {.inline.} =
  self.anonStruct50.hi = newVal

type AnonStruct51 {.packed.} = object
  x: Half
  y: Half
  z: Half
  w: Half
type AnonStruct52 {.packed.} = object
  s0: Half
  s1: Half
  s2: Half
  s3: Half
type AnonStruct53 {.packed.} = object
  lo: Half2
  hi: Half2

type Half4* {.bycopy, union.} = object
  ##[A vector of 4 'Half's.
     Can be accessed by: `x, y, z, w: Half`
     `s0, s1, s2, s3: Half`
     `lo, hi: Half2`]##
  s*: array[4, Half]
  when defined(HardwareDependentHalf2):
    v2*: array[2, HardwareDependentHalf2]
  when defined(HardwareDependentHalf4):
    v4*: HardwareDependentHalf4
  anonStruct51: AnonStruct51
  anonStruct52: AnonStruct52
  anonStruct53: AnonStruct53


func x*(self: Half4): Half {.inline.} =
  self.anonStruct51.x

func `x=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct51.x = newVal

func y*(self: Half4): Half {.inline.} =
  self.anonStruct51.y

func `y=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct51.y = newVal

func z*(self: Half4): Half {.inline.} =
  self.anonStruct51.z

func `z=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct51.z = newVal

func w*(self: Half4): Half {.inline.} =
  self.anonStruct51.w

func `w=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct51.w = newVal

func s0*(self: Half4): Half {.inline.} =
  self.anonStruct52.s0

func `s0=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct52.s0 = newVal

func s1*(self: Half4): Half {.inline.} =
  self.anonStruct52.s1

func `s1=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct52.s1 = newVal

func s2*(self: Half4): Half {.inline.} =
  self.anonStruct52.s2

func `s2=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct52.s2 = newVal

func s3*(self: Half4): Half {.inline.} =
  self.anonStruct52.s3

func `s3=`*(self: var Half4; newVal: Half) {.inline.} =
  self.anonStruct52.s3 = newVal

func lo*(self: Half4): Half2 {.inline.} =
  self.anonStruct53.lo

func `lo=`*(self: var Half4; newVal: Half2) {.inline.} =
  self.anonStruct53.lo = newVal

func hi*(self: Half4): Half2 {.inline.} =
  self.anonStruct53.hi

func `hi=`*(self: var Half4; newVal: Half2) {.inline.} =
  self.anonStruct53.hi = newVal

type AnonStruct54 {.packed.} = object
  x: Half
  y: Half
  z: Half
  w: Half
type AnonStruct55 {.packed.} = object
  s0: Half
  s1: Half
  s2: Half
  s3: Half
  s4: Half
  s5: Half
  s6: Half
  s7: Half
type AnonStruct56 {.packed.} = object
  lo: Half4
  hi: Half4

type Half8* {.bycopy, union.} = object
  ##[A vector of 8 'Half's.
     Can be accessed by: `x, y, z, w: Half`
     `s0, s1, s2, s3, s4, s5, s6, s7: Half`
     `lo, hi: Half4`]##
  s*: array[8, Half]
  when defined(HardwareDependentHalf2):
    v2*: array[4, HardwareDependentHalf2]
  when defined(HardwareDependentHalf4):
    v4*: array[2, HardwareDependentHalf4]
  when defined(HardwareDependentHalf8):
    v8*: HardwareDependentHalf8
  anonStruct54: AnonStruct54
  anonStruct55: AnonStruct55
  anonStruct56: AnonStruct56


func x*(self: Half8): Half {.inline.} =
  self.anonStruct54.x

func `x=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct54.x = newVal

func y*(self: Half8): Half {.inline.} =
  self.anonStruct54.y

func `y=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct54.y = newVal

func z*(self: Half8): Half {.inline.} =
  self.anonStruct54.z

func `z=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct54.z = newVal

func w*(self: Half8): Half {.inline.} =
  self.anonStruct54.w

func `w=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct54.w = newVal

func s0*(self: Half8): Half {.inline.} =
  self.anonStruct55.s0

func `s0=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s0 = newVal

func s1*(self: Half8): Half {.inline.} =
  self.anonStruct55.s1

func `s1=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s1 = newVal

func s2*(self: Half8): Half {.inline.} =
  self.anonStruct55.s2

func `s2=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s2 = newVal

func s3*(self: Half8): Half {.inline.} =
  self.anonStruct55.s3

func `s3=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s3 = newVal

func s4*(self: Half8): Half {.inline.} =
  self.anonStruct55.s4

func `s4=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s4 = newVal

func s5*(self: Half8): Half {.inline.} =
  self.anonStruct55.s5

func `s5=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s5 = newVal

func s6*(self: Half8): Half {.inline.} =
  self.anonStruct55.s6

func `s6=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s6 = newVal

func s7*(self: Half8): Half {.inline.} =
  self.anonStruct55.s7

func `s7=`*(self: var Half8; newVal: Half) {.inline.} =
  self.anonStruct55.s7 = newVal

func lo*(self: Half8): Half4 {.inline.} =
  self.anonStruct56.lo

func `lo=`*(self: var Half8; newVal: Half4) {.inline.} =
  self.anonStruct56.lo = newVal

func hi*(self: Half8): Half4 {.inline.} =
  self.anonStruct56.hi

func `hi=`*(self: var Half8; newVal: Half4) {.inline.} =
  self.anonStruct56.hi = newVal

type AnonStruct57 {.packed.} = object
  x: Half
  y: Half
  z: Half
  w: Half
  spacer4: Half
  spacer5: Half
  spacer6: Half
  spacer7: Half
  spacer8: Half
  spacer9: Half
  sa: Half
  sb: Half
  sc: Half
  sd: Half
  se: Half
  sf: Half
type AnonStruct58 {.packed.} = object
  s0: Half
  s1: Half
  s2: Half
  s3: Half
  s4: Half
  s5: Half
  s6: Half
  s7: Half
  s8: Half
  s9: Half
  sAA: Half
  sBB: Half
  sCC: Half
  sDD: Half
  sEE: Half
  sFF: Half
type AnonStruct59 {.packed.} = object
  lo: Half8
  hi: Half8

type Half16* {.bycopy, union.} = object
  ##[A vector of 16 'Half's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Half`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Half`
     `lo, hi: Half8`]##
  s*: array[16, Half]
  when defined(HardwareDependentHalf2):
    v2*: array[8, HardwareDependentHalf2]
  when defined(HardwareDependentHalf4):
    v4*: array[4, HardwareDependentHalf4]
  when defined(HardwareDependentHalf8):
    v8*: array[2, HardwareDependentHalf8]
  when defined(HardwareDependentHalf16):
    v16*: HardwareDependentHalf16
  anonStruct57: AnonStruct57
  anonStruct58: AnonStruct58
  anonStruct59: AnonStruct59


func x*(self: Half16): Half {.inline.} =
  self.anonStruct57.x

func `x=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.x = newVal

func y*(self: Half16): Half {.inline.} =
  self.anonStruct57.y

func `y=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.y = newVal

func z*(self: Half16): Half {.inline.} =
  self.anonStruct57.z

func `z=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.z = newVal

func w*(self: Half16): Half {.inline.} =
  self.anonStruct57.w

func `w=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.w = newVal

func spacer4*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer4

func `spacer4=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer4 = newVal

func spacer5*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer5

func `spacer5=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer5 = newVal

func spacer6*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer6

func `spacer6=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer6 = newVal

func spacer7*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer7

func `spacer7=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer7 = newVal

func spacer8*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer8

func `spacer8=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer8 = newVal

func spacer9*(self: Half16): Half {.inline.} =
  self.anonStruct57.spacer9

func `spacer9=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.spacer9 = newVal

func sa*(self: Half16): Half {.inline.} =
  self.anonStruct57.sa

func `sa=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.sa = newVal

func sb*(self: Half16): Half {.inline.} =
  self.anonStruct57.sb

func `sb=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.sb = newVal

func sc*(self: Half16): Half {.inline.} =
  self.anonStruct57.sc

func `sc=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.sc = newVal

func sd*(self: Half16): Half {.inline.} =
  self.anonStruct57.sd

func `sd=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.sd = newVal

func se*(self: Half16): Half {.inline.} =
  self.anonStruct57.se

func `se=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.se = newVal

func sf*(self: Half16): Half {.inline.} =
  self.anonStruct57.sf

func `sf=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct57.sf = newVal

func s0*(self: Half16): Half {.inline.} =
  self.anonStruct58.s0

func `s0=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s0 = newVal

func s1*(self: Half16): Half {.inline.} =
  self.anonStruct58.s1

func `s1=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s1 = newVal

func s2*(self: Half16): Half {.inline.} =
  self.anonStruct58.s2

func `s2=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s2 = newVal

func s3*(self: Half16): Half {.inline.} =
  self.anonStruct58.s3

func `s3=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s3 = newVal

func s4*(self: Half16): Half {.inline.} =
  self.anonStruct58.s4

func `s4=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s4 = newVal

func s5*(self: Half16): Half {.inline.} =
  self.anonStruct58.s5

func `s5=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s5 = newVal

func s6*(self: Half16): Half {.inline.} =
  self.anonStruct58.s6

func `s6=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s6 = newVal

func s7*(self: Half16): Half {.inline.} =
  self.anonStruct58.s7

func `s7=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s7 = newVal

func s8*(self: Half16): Half {.inline.} =
  self.anonStruct58.s8

func `s8=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s8 = newVal

func s9*(self: Half16): Half {.inline.} =
  self.anonStruct58.s9

func `s9=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.s9 = newVal

func sAA*(self: Half16): Half {.inline.} =
  self.anonStruct58.sAA

func `sAA=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sAA = newVal

func sBB*(self: Half16): Half {.inline.} =
  self.anonStruct58.sBB

func `sBB=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sBB = newVal

func sCC*(self: Half16): Half {.inline.} =
  self.anonStruct58.sCC

func `sCC=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sCC = newVal

func sDD*(self: Half16): Half {.inline.} =
  self.anonStruct58.sDD

func `sDD=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sDD = newVal

func sEE*(self: Half16): Half {.inline.} =
  self.anonStruct58.sEE

func `sEE=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sEE = newVal

func sFF*(self: Half16): Half {.inline.} =
  self.anonStruct58.sFF

func `sFF=`*(self: var Half16; newVal: Half) {.inline.} =
  self.anonStruct58.sFF = newVal

func lo*(self: Half16): Half8 {.inline.} =
  self.anonStruct59.lo

func `lo=`*(self: var Half16; newVal: Half8) {.inline.} =
  self.anonStruct59.lo = newVal

func hi*(self: Half16): Half8 {.inline.} =
  self.anonStruct59.hi

func `hi=`*(self: var Half16; newVal: Half8) {.inline.} =
  self.anonStruct59.hi = newVal

type AnonStruct60 {.packed.} = object
  x: Int
  y: Int
type AnonStruct61 {.packed.} = object
  s0: Int
  s1: Int
type AnonStruct62 {.packed.} = object
  lo: Int
  hi: Int

type Int2* {.bycopy, union.} = object
  ##[A vector of 2 'Int's.
     Can be accessed by: `x, y: Int`
     `s0, s1: Int`
     `lo, hi: Int`]##
  s*: array[2, Int]
  when defined(HardwareDependentInt2):
    v2*: HardwareDependentInt2
  anonStruct60: AnonStruct60
  anonStruct61: AnonStruct61
  anonStruct62: AnonStruct62


func x*(self: Int2): Int {.inline.} =
  self.anonStruct60.x

func `x=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct60.x = newVal

func y*(self: Int2): Int {.inline.} =
  self.anonStruct60.y

func `y=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct60.y = newVal

func s0*(self: Int2): Int {.inline.} =
  self.anonStruct61.s0

func `s0=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct61.s0 = newVal

func s1*(self: Int2): Int {.inline.} =
  self.anonStruct61.s1

func `s1=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct61.s1 = newVal

func lo*(self: Int2): Int {.inline.} =
  self.anonStruct62.lo

func `lo=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct62.lo = newVal

func hi*(self: Int2): Int {.inline.} =
  self.anonStruct62.hi

func `hi=`*(self: var Int2; newVal: Int) {.inline.} =
  self.anonStruct62.hi = newVal

type AnonStruct63 {.packed.} = object
  x: Int
  y: Int
  z: Int
  w: Int
type AnonStruct64 {.packed.} = object
  s0: Int
  s1: Int
  s2: Int
  s3: Int
type AnonStruct65 {.packed.} = object
  lo: Int2
  hi: Int2

type Int4* {.bycopy, union.} = object
  ##[A vector of 4 'Int's.
     Can be accessed by: `x, y, z, w: Int`
     `s0, s1, s2, s3: Int`
     `lo, hi: Int2`]##
  s*: array[4, Int]
  when defined(HardwareDependentInt2):
    v2*: array[2, HardwareDependentInt2]
  when defined(HardwareDependentInt4):
    v4*: HardwareDependentInt4
  anonStruct63: AnonStruct63
  anonStruct64: AnonStruct64
  anonStruct65: AnonStruct65


func x*(self: Int4): Int {.inline.} =
  self.anonStruct63.x

func `x=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct63.x = newVal

func y*(self: Int4): Int {.inline.} =
  self.anonStruct63.y

func `y=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct63.y = newVal

func z*(self: Int4): Int {.inline.} =
  self.anonStruct63.z

func `z=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct63.z = newVal

func w*(self: Int4): Int {.inline.} =
  self.anonStruct63.w

func `w=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct63.w = newVal

func s0*(self: Int4): Int {.inline.} =
  self.anonStruct64.s0

func `s0=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct64.s0 = newVal

func s1*(self: Int4): Int {.inline.} =
  self.anonStruct64.s1

func `s1=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct64.s1 = newVal

func s2*(self: Int4): Int {.inline.} =
  self.anonStruct64.s2

func `s2=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct64.s2 = newVal

func s3*(self: Int4): Int {.inline.} =
  self.anonStruct64.s3

func `s3=`*(self: var Int4; newVal: Int) {.inline.} =
  self.anonStruct64.s3 = newVal

func lo*(self: Int4): Int2 {.inline.} =
  self.anonStruct65.lo

func `lo=`*(self: var Int4; newVal: Int2) {.inline.} =
  self.anonStruct65.lo = newVal

func hi*(self: Int4): Int2 {.inline.} =
  self.anonStruct65.hi

func `hi=`*(self: var Int4; newVal: Int2) {.inline.} =
  self.anonStruct65.hi = newVal

type AnonStruct66 {.packed.} = object
  x: Int
  y: Int
  z: Int
  w: Int
type AnonStruct67 {.packed.} = object
  s0: Int
  s1: Int
  s2: Int
  s3: Int
  s4: Int
  s5: Int
  s6: Int
  s7: Int
type AnonStruct68 {.packed.} = object
  lo: Int4
  hi: Int4

type Int8* {.bycopy, union.} = object
  ##[A vector of 8 'Int's.
     Can be accessed by: `x, y, z, w: Int`
     `s0, s1, s2, s3, s4, s5, s6, s7: Int`
     `lo, hi: Int4`]##
  s*: array[8, Int]
  when defined(HardwareDependentInt2):
    v2*: array[4, HardwareDependentInt2]
  when defined(HardwareDependentInt4):
    v4*: array[2, HardwareDependentInt4]
  when defined(HardwareDependentInt8):
    v8*: HardwareDependentInt8
  anonStruct66: AnonStruct66
  anonStruct67: AnonStruct67
  anonStruct68: AnonStruct68


func x*(self: Int8): Int {.inline.} =
  self.anonStruct66.x

func `x=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct66.x = newVal

func y*(self: Int8): Int {.inline.} =
  self.anonStruct66.y

func `y=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct66.y = newVal

func z*(self: Int8): Int {.inline.} =
  self.anonStruct66.z

func `z=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct66.z = newVal

func w*(self: Int8): Int {.inline.} =
  self.anonStruct66.w

func `w=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct66.w = newVal

func s0*(self: Int8): Int {.inline.} =
  self.anonStruct67.s0

func `s0=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s0 = newVal

func s1*(self: Int8): Int {.inline.} =
  self.anonStruct67.s1

func `s1=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s1 = newVal

func s2*(self: Int8): Int {.inline.} =
  self.anonStruct67.s2

func `s2=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s2 = newVal

func s3*(self: Int8): Int {.inline.} =
  self.anonStruct67.s3

func `s3=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s3 = newVal

func s4*(self: Int8): Int {.inline.} =
  self.anonStruct67.s4

func `s4=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s4 = newVal

func s5*(self: Int8): Int {.inline.} =
  self.anonStruct67.s5

func `s5=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s5 = newVal

func s6*(self: Int8): Int {.inline.} =
  self.anonStruct67.s6

func `s6=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s6 = newVal

func s7*(self: Int8): Int {.inline.} =
  self.anonStruct67.s7

func `s7=`*(self: var Int8; newVal: Int) {.inline.} =
  self.anonStruct67.s7 = newVal

func lo*(self: Int8): Int4 {.inline.} =
  self.anonStruct68.lo

func `lo=`*(self: var Int8; newVal: Int4) {.inline.} =
  self.anonStruct68.lo = newVal

func hi*(self: Int8): Int4 {.inline.} =
  self.anonStruct68.hi

func `hi=`*(self: var Int8; newVal: Int4) {.inline.} =
  self.anonStruct68.hi = newVal

type AnonStruct69 {.packed.} = object
  x: Int
  y: Int
  z: Int
  w: Int
  spacer4: Int
  spacer5: Int
  spacer6: Int
  spacer7: Int
  spacer8: Int
  spacer9: Int
  sa: Int
  sb: Int
  sc: Int
  sd: Int
  se: Int
  sf: Int
type AnonStruct70 {.packed.} = object
  s0: Int
  s1: Int
  s2: Int
  s3: Int
  s4: Int
  s5: Int
  s6: Int
  s7: Int
  s8: Int
  s9: Int
  sAA: Int
  sBB: Int
  sCC: Int
  sDD: Int
  sEE: Int
  sFF: Int
type AnonStruct71 {.packed.} = object
  lo: Int8
  hi: Int8

type Int16* {.bycopy, union.} = object
  ##[A vector of 16 'Int's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Int`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Int`
     `lo, hi: Int8`]##
  s*: array[16, Int]
  when defined(HardwareDependentInt2):
    v2*: array[8, HardwareDependentInt2]
  when defined(HardwareDependentInt4):
    v4*: array[4, HardwareDependentInt4]
  when defined(HardwareDependentInt8):
    v8*: array[2, HardwareDependentInt8]
  when defined(HardwareDependentInt16):
    v16*: HardwareDependentInt16
  anonStruct69: AnonStruct69
  anonStruct70: AnonStruct70
  anonStruct71: AnonStruct71


func x*(self: Int16): Int {.inline.} =
  self.anonStruct69.x

func `x=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.x = newVal

func y*(self: Int16): Int {.inline.} =
  self.anonStruct69.y

func `y=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.y = newVal

func z*(self: Int16): Int {.inline.} =
  self.anonStruct69.z

func `z=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.z = newVal

func w*(self: Int16): Int {.inline.} =
  self.anonStruct69.w

func `w=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.w = newVal

func spacer4*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer4

func `spacer4=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer4 = newVal

func spacer5*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer5

func `spacer5=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer5 = newVal

func spacer6*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer6

func `spacer6=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer6 = newVal

func spacer7*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer7

func `spacer7=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer7 = newVal

func spacer8*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer8

func `spacer8=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer8 = newVal

func spacer9*(self: Int16): Int {.inline.} =
  self.anonStruct69.spacer9

func `spacer9=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.spacer9 = newVal

func sa*(self: Int16): Int {.inline.} =
  self.anonStruct69.sa

func `sa=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.sa = newVal

func sb*(self: Int16): Int {.inline.} =
  self.anonStruct69.sb

func `sb=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.sb = newVal

func sc*(self: Int16): Int {.inline.} =
  self.anonStruct69.sc

func `sc=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.sc = newVal

func sd*(self: Int16): Int {.inline.} =
  self.anonStruct69.sd

func `sd=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.sd = newVal

func se*(self: Int16): Int {.inline.} =
  self.anonStruct69.se

func `se=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.se = newVal

func sf*(self: Int16): Int {.inline.} =
  self.anonStruct69.sf

func `sf=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct69.sf = newVal

func s0*(self: Int16): Int {.inline.} =
  self.anonStruct70.s0

func `s0=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s0 = newVal

func s1*(self: Int16): Int {.inline.} =
  self.anonStruct70.s1

func `s1=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s1 = newVal

func s2*(self: Int16): Int {.inline.} =
  self.anonStruct70.s2

func `s2=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s2 = newVal

func s3*(self: Int16): Int {.inline.} =
  self.anonStruct70.s3

func `s3=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s3 = newVal

func s4*(self: Int16): Int {.inline.} =
  self.anonStruct70.s4

func `s4=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s4 = newVal

func s5*(self: Int16): Int {.inline.} =
  self.anonStruct70.s5

func `s5=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s5 = newVal

func s6*(self: Int16): Int {.inline.} =
  self.anonStruct70.s6

func `s6=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s6 = newVal

func s7*(self: Int16): Int {.inline.} =
  self.anonStruct70.s7

func `s7=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s7 = newVal

func s8*(self: Int16): Int {.inline.} =
  self.anonStruct70.s8

func `s8=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s8 = newVal

func s9*(self: Int16): Int {.inline.} =
  self.anonStruct70.s9

func `s9=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.s9 = newVal

func sAA*(self: Int16): Int {.inline.} =
  self.anonStruct70.sAA

func `sAA=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sAA = newVal

func sBB*(self: Int16): Int {.inline.} =
  self.anonStruct70.sBB

func `sBB=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sBB = newVal

func sCC*(self: Int16): Int {.inline.} =
  self.anonStruct70.sCC

func `sCC=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sCC = newVal

func sDD*(self: Int16): Int {.inline.} =
  self.anonStruct70.sDD

func `sDD=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sDD = newVal

func sEE*(self: Int16): Int {.inline.} =
  self.anonStruct70.sEE

func `sEE=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sEE = newVal

func sFF*(self: Int16): Int {.inline.} =
  self.anonStruct70.sFF

func `sFF=`*(self: var Int16; newVal: Int) {.inline.} =
  self.anonStruct70.sFF = newVal

func lo*(self: Int16): Int8 {.inline.} =
  self.anonStruct71.lo

func `lo=`*(self: var Int16; newVal: Int8) {.inline.} =
  self.anonStruct71.lo = newVal

func hi*(self: Int16): Int8 {.inline.} =
  self.anonStruct71.hi

func `hi=`*(self: var Int16; newVal: Int8) {.inline.} =
  self.anonStruct71.hi = newVal

type AnonStruct72 {.packed.} = object
  x: Uint
  y: Uint
type AnonStruct73 {.packed.} = object
  s0: Uint
  s1: Uint
type AnonStruct74 {.packed.} = object
  lo: Uint
  hi: Uint

type Uint2* {.bycopy, union.} = object
  ##[A vector of 2 'Uint's.
     Can be accessed by: `x, y: Uint`
     `s0, s1: Uint`
     `lo, hi: Uint`]##
  s*: array[2, Uint]
  when defined(HardwareDependentUint2):
    v2*: HardwareDependentUint2
  anonStruct72: AnonStruct72
  anonStruct73: AnonStruct73
  anonStruct74: AnonStruct74


func x*(self: Uint2): Uint {.inline.} =
  self.anonStruct72.x

func `x=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct72.x = newVal

func y*(self: Uint2): Uint {.inline.} =
  self.anonStruct72.y

func `y=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct72.y = newVal

func s0*(self: Uint2): Uint {.inline.} =
  self.anonStruct73.s0

func `s0=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct73.s0 = newVal

func s1*(self: Uint2): Uint {.inline.} =
  self.anonStruct73.s1

func `s1=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct73.s1 = newVal

func lo*(self: Uint2): Uint {.inline.} =
  self.anonStruct74.lo

func `lo=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct74.lo = newVal

func hi*(self: Uint2): Uint {.inline.} =
  self.anonStruct74.hi

func `hi=`*(self: var Uint2; newVal: Uint) {.inline.} =
  self.anonStruct74.hi = newVal

type AnonStruct75 {.packed.} = object
  x: Uint
  y: Uint
  z: Uint
  w: Uint
type AnonStruct76 {.packed.} = object
  s0: Uint
  s1: Uint
  s2: Uint
  s3: Uint
type AnonStruct77 {.packed.} = object
  lo: Uint2
  hi: Uint2

type Uint4* {.bycopy, union.} = object
  ##[A vector of 4 'Uint's.
     Can be accessed by: `x, y, z, w: Uint`
     `s0, s1, s2, s3: Uint`
     `lo, hi: Uint2`]##
  s*: array[4, Uint]
  when defined(HardwareDependentUint2):
    v2*: array[2, HardwareDependentUint2]
  when defined(HardwareDependentUint4):
    v4*: HardwareDependentUint4
  anonStruct75: AnonStruct75
  anonStruct76: AnonStruct76
  anonStruct77: AnonStruct77


func x*(self: Uint4): Uint {.inline.} =
  self.anonStruct75.x

func `x=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct75.x = newVal

func y*(self: Uint4): Uint {.inline.} =
  self.anonStruct75.y

func `y=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct75.y = newVal

func z*(self: Uint4): Uint {.inline.} =
  self.anonStruct75.z

func `z=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct75.z = newVal

func w*(self: Uint4): Uint {.inline.} =
  self.anonStruct75.w

func `w=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct75.w = newVal

func s0*(self: Uint4): Uint {.inline.} =
  self.anonStruct76.s0

func `s0=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct76.s0 = newVal

func s1*(self: Uint4): Uint {.inline.} =
  self.anonStruct76.s1

func `s1=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct76.s1 = newVal

func s2*(self: Uint4): Uint {.inline.} =
  self.anonStruct76.s2

func `s2=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct76.s2 = newVal

func s3*(self: Uint4): Uint {.inline.} =
  self.anonStruct76.s3

func `s3=`*(self: var Uint4; newVal: Uint) {.inline.} =
  self.anonStruct76.s3 = newVal

func lo*(self: Uint4): Uint2 {.inline.} =
  self.anonStruct77.lo

func `lo=`*(self: var Uint4; newVal: Uint2) {.inline.} =
  self.anonStruct77.lo = newVal

func hi*(self: Uint4): Uint2 {.inline.} =
  self.anonStruct77.hi

func `hi=`*(self: var Uint4; newVal: Uint2) {.inline.} =
  self.anonStruct77.hi = newVal

type AnonStruct78 {.packed.} = object
  x: Uint
  y: Uint
  z: Uint
  w: Uint
type AnonStruct79 {.packed.} = object
  s0: Uint
  s1: Uint
  s2: Uint
  s3: Uint
  s4: Uint
  s5: Uint
  s6: Uint
  s7: Uint
type AnonStruct80 {.packed.} = object
  lo: Uint4
  hi: Uint4

type Uint8* {.bycopy, union.} = object
  ##[A vector of 8 'Uint's.
     Can be accessed by: `x, y, z, w: Uint`
     `s0, s1, s2, s3, s4, s5, s6, s7: Uint`
     `lo, hi: Uint4`]##
  s*: array[8, Uint]
  when defined(HardwareDependentUint2):
    v2*: array[4, HardwareDependentUint2]
  when defined(HardwareDependentUint4):
    v4*: array[2, HardwareDependentUint4]
  when defined(HardwareDependentUint8):
    v8*: HardwareDependentUint8
  anonStruct78: AnonStruct78
  anonStruct79: AnonStruct79
  anonStruct80: AnonStruct80


func x*(self: Uint8): Uint {.inline.} =
  self.anonStruct78.x

func `x=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct78.x = newVal

func y*(self: Uint8): Uint {.inline.} =
  self.anonStruct78.y

func `y=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct78.y = newVal

func z*(self: Uint8): Uint {.inline.} =
  self.anonStruct78.z

func `z=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct78.z = newVal

func w*(self: Uint8): Uint {.inline.} =
  self.anonStruct78.w

func `w=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct78.w = newVal

func s0*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s0

func `s0=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s0 = newVal

func s1*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s1

func `s1=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s1 = newVal

func s2*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s2

func `s2=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s2 = newVal

func s3*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s3

func `s3=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s3 = newVal

func s4*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s4

func `s4=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s4 = newVal

func s5*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s5

func `s5=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s5 = newVal

func s6*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s6

func `s6=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s6 = newVal

func s7*(self: Uint8): Uint {.inline.} =
  self.anonStruct79.s7

func `s7=`*(self: var Uint8; newVal: Uint) {.inline.} =
  self.anonStruct79.s7 = newVal

func lo*(self: Uint8): Uint4 {.inline.} =
  self.anonStruct80.lo

func `lo=`*(self: var Uint8; newVal: Uint4) {.inline.} =
  self.anonStruct80.lo = newVal

func hi*(self: Uint8): Uint4 {.inline.} =
  self.anonStruct80.hi

func `hi=`*(self: var Uint8; newVal: Uint4) {.inline.} =
  self.anonStruct80.hi = newVal

type AnonStruct81 {.packed.} = object
  x: Uint
  y: Uint
  z: Uint
  w: Uint
  spacer4: Uint
  spacer5: Uint
  spacer6: Uint
  spacer7: Uint
  spacer8: Uint
  spacer9: Uint
  sa: Uint
  sb: Uint
  sc: Uint
  sd: Uint
  se: Uint
  sf: Uint
type AnonStruct82 {.packed.} = object
  s0: Uint
  s1: Uint
  s2: Uint
  s3: Uint
  s4: Uint
  s5: Uint
  s6: Uint
  s7: Uint
  s8: Uint
  s9: Uint
  sAA: Uint
  sBB: Uint
  sCC: Uint
  sDD: Uint
  sEE: Uint
  sFF: Uint
type AnonStruct83 {.packed.} = object
  lo: Uint8
  hi: Uint8

type Uint16* {.bycopy, union.} = object
  ##[A vector of 16 'Uint's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Uint`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Uint`
     `lo, hi: Uint8`]##
  s*: array[16, Uint]
  when defined(HardwareDependentUint2):
    v2*: array[8, HardwareDependentUint2]
  when defined(HardwareDependentUint4):
    v4*: array[4, HardwareDependentUint4]
  when defined(HardwareDependentUint8):
    v8*: array[2, HardwareDependentUint8]
  when defined(HardwareDependentUint16):
    v16*: HardwareDependentUint16
  anonStruct81: AnonStruct81
  anonStruct82: AnonStruct82
  anonStruct83: AnonStruct83


func x*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.x

func `x=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.x = newVal

func y*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.y

func `y=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.y = newVal

func z*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.z

func `z=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.z = newVal

func w*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.w

func `w=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.w = newVal

func spacer4*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer4

func `spacer4=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer4 = newVal

func spacer5*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer5

func `spacer5=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer5 = newVal

func spacer6*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer6

func `spacer6=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer6 = newVal

func spacer7*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer7

func `spacer7=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer7 = newVal

func spacer8*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer8

func `spacer8=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer8 = newVal

func spacer9*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.spacer9

func `spacer9=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.spacer9 = newVal

func sa*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.sa

func `sa=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.sa = newVal

func sb*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.sb

func `sb=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.sb = newVal

func sc*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.sc

func `sc=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.sc = newVal

func sd*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.sd

func `sd=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.sd = newVal

func se*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.se

func `se=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.se = newVal

func sf*(self: Uint16): Uint {.inline.} =
  self.anonStruct81.sf

func `sf=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct81.sf = newVal

func s0*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s0

func `s0=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s0 = newVal

func s1*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s1

func `s1=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s1 = newVal

func s2*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s2

func `s2=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s2 = newVal

func s3*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s3

func `s3=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s3 = newVal

func s4*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s4

func `s4=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s4 = newVal

func s5*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s5

func `s5=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s5 = newVal

func s6*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s6

func `s6=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s6 = newVal

func s7*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s7

func `s7=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s7 = newVal

func s8*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s8

func `s8=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s8 = newVal

func s9*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.s9

func `s9=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.s9 = newVal

func sAA*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sAA

func `sAA=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sAA = newVal

func sBB*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sBB

func `sBB=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sBB = newVal

func sCC*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sCC

func `sCC=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sCC = newVal

func sDD*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sDD

func `sDD=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sDD = newVal

func sEE*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sEE

func `sEE=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sEE = newVal

func sFF*(self: Uint16): Uint {.inline.} =
  self.anonStruct82.sFF

func `sFF=`*(self: var Uint16; newVal: Uint) {.inline.} =
  self.anonStruct82.sFF = newVal

func lo*(self: Uint16): Uint8 {.inline.} =
  self.anonStruct83.lo

func `lo=`*(self: var Uint16; newVal: Uint8) {.inline.} =
  self.anonStruct83.lo = newVal

func hi*(self: Uint16): Uint8 {.inline.} =
  self.anonStruct83.hi

func `hi=`*(self: var Uint16; newVal: Uint8) {.inline.} =
  self.anonStruct83.hi = newVal

type AnonStruct84 {.packed.} = object
  x: Long
  y: Long
type AnonStruct85 {.packed.} = object
  s0: Long
  s1: Long
type AnonStruct86 {.packed.} = object
  lo: Long
  hi: Long

type Long2* {.bycopy, union.} = object
  ##[A vector of 2 'Long's.
     Can be accessed by: `x, y: Long`
     `s0, s1: Long`
     `lo, hi: Long`]##
  s*: array[2, Long]
  when defined(HardwareDependentLong2):
    v2*: HardwareDependentLong2
  anonStruct84: AnonStruct84
  anonStruct85: AnonStruct85
  anonStruct86: AnonStruct86


func x*(self: Long2): Long {.inline.} =
  self.anonStruct84.x

func `x=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct84.x = newVal

func y*(self: Long2): Long {.inline.} =
  self.anonStruct84.y

func `y=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct84.y = newVal

func s0*(self: Long2): Long {.inline.} =
  self.anonStruct85.s0

func `s0=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct85.s0 = newVal

func s1*(self: Long2): Long {.inline.} =
  self.anonStruct85.s1

func `s1=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct85.s1 = newVal

func lo*(self: Long2): Long {.inline.} =
  self.anonStruct86.lo

func `lo=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct86.lo = newVal

func hi*(self: Long2): Long {.inline.} =
  self.anonStruct86.hi

func `hi=`*(self: var Long2; newVal: Long) {.inline.} =
  self.anonStruct86.hi = newVal

type AnonStruct87 {.packed.} = object
  x: Long
  y: Long
  z: Long
  w: Long
type AnonStruct88 {.packed.} = object
  s0: Long
  s1: Long
  s2: Long
  s3: Long
type AnonStruct89 {.packed.} = object
  lo: Long2
  hi: Long2

type Long4* {.bycopy, union.} = object
  ##[A vector of 4 'Long's.
     Can be accessed by: `x, y, z, w: Long`
     `s0, s1, s2, s3: Long`
     `lo, hi: Long2`]##
  s*: array[4, Long]
  when defined(HardwareDependentLong2):
    v2*: array[2, HardwareDependentLong2]
  when defined(HardwareDependentLong4):
    v4*: HardwareDependentLong4
  anonStruct87: AnonStruct87
  anonStruct88: AnonStruct88
  anonStruct89: AnonStruct89


func x*(self: Long4): Long {.inline.} =
  self.anonStruct87.x

func `x=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct87.x = newVal

func y*(self: Long4): Long {.inline.} =
  self.anonStruct87.y

func `y=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct87.y = newVal

func z*(self: Long4): Long {.inline.} =
  self.anonStruct87.z

func `z=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct87.z = newVal

func w*(self: Long4): Long {.inline.} =
  self.anonStruct87.w

func `w=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct87.w = newVal

func s0*(self: Long4): Long {.inline.} =
  self.anonStruct88.s0

func `s0=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct88.s0 = newVal

func s1*(self: Long4): Long {.inline.} =
  self.anonStruct88.s1

func `s1=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct88.s1 = newVal

func s2*(self: Long4): Long {.inline.} =
  self.anonStruct88.s2

func `s2=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct88.s2 = newVal

func s3*(self: Long4): Long {.inline.} =
  self.anonStruct88.s3

func `s3=`*(self: var Long4; newVal: Long) {.inline.} =
  self.anonStruct88.s3 = newVal

func lo*(self: Long4): Long2 {.inline.} =
  self.anonStruct89.lo

func `lo=`*(self: var Long4; newVal: Long2) {.inline.} =
  self.anonStruct89.lo = newVal

func hi*(self: Long4): Long2 {.inline.} =
  self.anonStruct89.hi

func `hi=`*(self: var Long4; newVal: Long2) {.inline.} =
  self.anonStruct89.hi = newVal

type AnonStruct90 {.packed.} = object
  x: Long
  y: Long
  z: Long
  w: Long
type AnonStruct91 {.packed.} = object
  s0: Long
  s1: Long
  s2: Long
  s3: Long
  s4: Long
  s5: Long
  s6: Long
  s7: Long
type AnonStruct92 {.packed.} = object
  lo: Long4
  hi: Long4

type Long8* {.bycopy, union.} = object
  ##[A vector of 8 'Long's.
     Can be accessed by: `x, y, z, w: Long`
     `s0, s1, s2, s3, s4, s5, s6, s7: Long`
     `lo, hi: Long4`]##
  s*: array[8, Long]
  when defined(HardwareDependentLong2):
    v2*: array[4, HardwareDependentLong2]
  when defined(HardwareDependentLong4):
    v4*: array[2, HardwareDependentLong4]
  when defined(HardwareDependentLong8):
    v8*: HardwareDependentLong8
  anonStruct90: AnonStruct90
  anonStruct91: AnonStruct91
  anonStruct92: AnonStruct92


func x*(self: Long8): Long {.inline.} =
  self.anonStruct90.x

func `x=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct90.x = newVal

func y*(self: Long8): Long {.inline.} =
  self.anonStruct90.y

func `y=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct90.y = newVal

func z*(self: Long8): Long {.inline.} =
  self.anonStruct90.z

func `z=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct90.z = newVal

func w*(self: Long8): Long {.inline.} =
  self.anonStruct90.w

func `w=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct90.w = newVal

func s0*(self: Long8): Long {.inline.} =
  self.anonStruct91.s0

func `s0=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s0 = newVal

func s1*(self: Long8): Long {.inline.} =
  self.anonStruct91.s1

func `s1=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s1 = newVal

func s2*(self: Long8): Long {.inline.} =
  self.anonStruct91.s2

func `s2=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s2 = newVal

func s3*(self: Long8): Long {.inline.} =
  self.anonStruct91.s3

func `s3=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s3 = newVal

func s4*(self: Long8): Long {.inline.} =
  self.anonStruct91.s4

func `s4=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s4 = newVal

func s5*(self: Long8): Long {.inline.} =
  self.anonStruct91.s5

func `s5=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s5 = newVal

func s6*(self: Long8): Long {.inline.} =
  self.anonStruct91.s6

func `s6=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s6 = newVal

func s7*(self: Long8): Long {.inline.} =
  self.anonStruct91.s7

func `s7=`*(self: var Long8; newVal: Long) {.inline.} =
  self.anonStruct91.s7 = newVal

func lo*(self: Long8): Long4 {.inline.} =
  self.anonStruct92.lo

func `lo=`*(self: var Long8; newVal: Long4) {.inline.} =
  self.anonStruct92.lo = newVal

func hi*(self: Long8): Long4 {.inline.} =
  self.anonStruct92.hi

func `hi=`*(self: var Long8; newVal: Long4) {.inline.} =
  self.anonStruct92.hi = newVal

type AnonStruct93 {.packed.} = object
  x: Long
  y: Long
  z: Long
  w: Long
  spacer4: Long
  spacer5: Long
  spacer6: Long
  spacer7: Long
  spacer8: Long
  spacer9: Long
  sa: Long
  sb: Long
  sc: Long
  sd: Long
  se: Long
  sf: Long
type AnonStruct94 {.packed.} = object
  s0: Long
  s1: Long
  s2: Long
  s3: Long
  s4: Long
  s5: Long
  s6: Long
  s7: Long
  s8: Long
  s9: Long
  sAA: Long
  sBB: Long
  sCC: Long
  sDD: Long
  sEE: Long
  sFF: Long
type AnonStruct95 {.packed.} = object
  lo: Long8
  hi: Long8

type Long16* {.bycopy, union.} = object
  ##[A vector of 16 'Long's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Long`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Long`
     `lo, hi: Long8`]##
  s*: array[16, Long]
  when defined(HardwareDependentLong2):
    v2*: array[8, HardwareDependentLong2]
  when defined(HardwareDependentLong4):
    v4*: array[4, HardwareDependentLong4]
  when defined(HardwareDependentLong8):
    v8*: array[2, HardwareDependentLong8]
  when defined(HardwareDependentLong16):
    v16*: HardwareDependentLong16
  anonStruct93: AnonStruct93
  anonStruct94: AnonStruct94
  anonStruct95: AnonStruct95


func x*(self: Long16): Long {.inline.} =
  self.anonStruct93.x

func `x=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.x = newVal

func y*(self: Long16): Long {.inline.} =
  self.anonStruct93.y

func `y=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.y = newVal

func z*(self: Long16): Long {.inline.} =
  self.anonStruct93.z

func `z=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.z = newVal

func w*(self: Long16): Long {.inline.} =
  self.anonStruct93.w

func `w=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.w = newVal

func spacer4*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer4

func `spacer4=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer4 = newVal

func spacer5*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer5

func `spacer5=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer5 = newVal

func spacer6*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer6

func `spacer6=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer6 = newVal

func spacer7*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer7

func `spacer7=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer7 = newVal

func spacer8*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer8

func `spacer8=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer8 = newVal

func spacer9*(self: Long16): Long {.inline.} =
  self.anonStruct93.spacer9

func `spacer9=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.spacer9 = newVal

func sa*(self: Long16): Long {.inline.} =
  self.anonStruct93.sa

func `sa=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.sa = newVal

func sb*(self: Long16): Long {.inline.} =
  self.anonStruct93.sb

func `sb=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.sb = newVal

func sc*(self: Long16): Long {.inline.} =
  self.anonStruct93.sc

func `sc=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.sc = newVal

func sd*(self: Long16): Long {.inline.} =
  self.anonStruct93.sd

func `sd=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.sd = newVal

func se*(self: Long16): Long {.inline.} =
  self.anonStruct93.se

func `se=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.se = newVal

func sf*(self: Long16): Long {.inline.} =
  self.anonStruct93.sf

func `sf=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct93.sf = newVal

func s0*(self: Long16): Long {.inline.} =
  self.anonStruct94.s0

func `s0=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s0 = newVal

func s1*(self: Long16): Long {.inline.} =
  self.anonStruct94.s1

func `s1=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s1 = newVal

func s2*(self: Long16): Long {.inline.} =
  self.anonStruct94.s2

func `s2=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s2 = newVal

func s3*(self: Long16): Long {.inline.} =
  self.anonStruct94.s3

func `s3=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s3 = newVal

func s4*(self: Long16): Long {.inline.} =
  self.anonStruct94.s4

func `s4=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s4 = newVal

func s5*(self: Long16): Long {.inline.} =
  self.anonStruct94.s5

func `s5=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s5 = newVal

func s6*(self: Long16): Long {.inline.} =
  self.anonStruct94.s6

func `s6=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s6 = newVal

func s7*(self: Long16): Long {.inline.} =
  self.anonStruct94.s7

func `s7=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s7 = newVal

func s8*(self: Long16): Long {.inline.} =
  self.anonStruct94.s8

func `s8=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s8 = newVal

func s9*(self: Long16): Long {.inline.} =
  self.anonStruct94.s9

func `s9=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.s9 = newVal

func sAA*(self: Long16): Long {.inline.} =
  self.anonStruct94.sAA

func `sAA=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sAA = newVal

func sBB*(self: Long16): Long {.inline.} =
  self.anonStruct94.sBB

func `sBB=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sBB = newVal

func sCC*(self: Long16): Long {.inline.} =
  self.anonStruct94.sCC

func `sCC=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sCC = newVal

func sDD*(self: Long16): Long {.inline.} =
  self.anonStruct94.sDD

func `sDD=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sDD = newVal

func sEE*(self: Long16): Long {.inline.} =
  self.anonStruct94.sEE

func `sEE=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sEE = newVal

func sFF*(self: Long16): Long {.inline.} =
  self.anonStruct94.sFF

func `sFF=`*(self: var Long16; newVal: Long) {.inline.} =
  self.anonStruct94.sFF = newVal

func lo*(self: Long16): Long8 {.inline.} =
  self.anonStruct95.lo

func `lo=`*(self: var Long16; newVal: Long8) {.inline.} =
  self.anonStruct95.lo = newVal

func hi*(self: Long16): Long8 {.inline.} =
  self.anonStruct95.hi

func `hi=`*(self: var Long16; newVal: Long8) {.inline.} =
  self.anonStruct95.hi = newVal

type AnonStruct96 {.packed.} = object
  x: Ulong
  y: Ulong
type AnonStruct97 {.packed.} = object
  s0: Ulong
  s1: Ulong
type AnonStruct98 {.packed.} = object
  lo: Ulong
  hi: Ulong

type Ulong2* {.bycopy, union.} = object
  ##[A vector of 2 'Ulong's.
     Can be accessed by: `x, y: Ulong`
     `s0, s1: Ulong`
     `lo, hi: Ulong`]##
  s*: array[2, Ulong]
  when defined(HardwareDependentUlong2):
    v2*: HardwareDependentUlong2
  anonStruct96: AnonStruct96
  anonStruct97: AnonStruct97
  anonStruct98: AnonStruct98


func x*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct96.x

func `x=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct96.x = newVal

func y*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct96.y

func `y=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct96.y = newVal

func s0*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct97.s0

func `s0=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct97.s0 = newVal

func s1*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct97.s1

func `s1=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct97.s1 = newVal

func lo*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct98.lo

func `lo=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct98.lo = newVal

func hi*(self: Ulong2): Ulong {.inline.} =
  self.anonStruct98.hi

func `hi=`*(self: var Ulong2; newVal: Ulong) {.inline.} =
  self.anonStruct98.hi = newVal

type AnonStruct99 {.packed.} = object
  x: Ulong
  y: Ulong
  z: Ulong
  w: Ulong
type AnonStruct100 {.packed.} = object
  s0: Ulong
  s1: Ulong
  s2: Ulong
  s3: Ulong
type AnonStruct101 {.packed.} = object
  lo: Ulong2
  hi: Ulong2

type Ulong4* {.bycopy, union.} = object
  ##[A vector of 4 'Ulong's.
     Can be accessed by: `x, y, z, w: Ulong`
     `s0, s1, s2, s3: Ulong`
     `lo, hi: Ulong2`]##
  s*: array[4, Ulong]
  when defined(HardwareDependentUlong2):
    v2*: array[2, HardwareDependentUlong2]
  when defined(HardwareDependentUlong4):
    v4*: HardwareDependentUlong4
  anonStruct99: AnonStruct99
  anonStruct100: AnonStruct100
  anonStruct101: AnonStruct101


func x*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct99.x

func `x=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct99.x = newVal

func y*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct99.y

func `y=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct99.y = newVal

func z*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct99.z

func `z=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct99.z = newVal

func w*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct99.w

func `w=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct99.w = newVal

func s0*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct100.s0

func `s0=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct100.s0 = newVal

func s1*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct100.s1

func `s1=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct100.s1 = newVal

func s2*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct100.s2

func `s2=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct100.s2 = newVal

func s3*(self: Ulong4): Ulong {.inline.} =
  self.anonStruct100.s3

func `s3=`*(self: var Ulong4; newVal: Ulong) {.inline.} =
  self.anonStruct100.s3 = newVal

func lo*(self: Ulong4): Ulong2 {.inline.} =
  self.anonStruct101.lo

func `lo=`*(self: var Ulong4; newVal: Ulong2) {.inline.} =
  self.anonStruct101.lo = newVal

func hi*(self: Ulong4): Ulong2 {.inline.} =
  self.anonStruct101.hi

func `hi=`*(self: var Ulong4; newVal: Ulong2) {.inline.} =
  self.anonStruct101.hi = newVal

type AnonStruct102 {.packed.} = object
  x: Ulong
  y: Ulong
  z: Ulong
  w: Ulong
type AnonStruct103 {.packed.} = object
  s0: Ulong
  s1: Ulong
  s2: Ulong
  s3: Ulong
  s4: Ulong
  s5: Ulong
  s6: Ulong
  s7: Ulong
type AnonStruct104 {.packed.} = object
  lo: Ulong4
  hi: Ulong4

type Ulong8* {.bycopy, union.} = object
  ##[A vector of 8 'Ulong's.
     Can be accessed by: `x, y, z, w: Ulong`
     `s0, s1, s2, s3, s4, s5, s6, s7: Ulong`
     `lo, hi: Ulong4`]##
  s*: array[8, Ulong]
  when defined(HardwareDependentUlong2):
    v2*: array[4, HardwareDependentUlong2]
  when defined(HardwareDependentUlong4):
    v4*: array[2, HardwareDependentUlong4]
  when defined(HardwareDependentUlong8):
    v8*: HardwareDependentUlong8
  anonStruct102: AnonStruct102
  anonStruct103: AnonStruct103
  anonStruct104: AnonStruct104


func x*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct102.x

func `x=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct102.x = newVal

func y*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct102.y

func `y=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct102.y = newVal

func z*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct102.z

func `z=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct102.z = newVal

func w*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct102.w

func `w=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct102.w = newVal

func s0*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s0

func `s0=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s0 = newVal

func s1*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s1

func `s1=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s1 = newVal

func s2*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s2

func `s2=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s2 = newVal

func s3*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s3

func `s3=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s3 = newVal

func s4*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s4

func `s4=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s4 = newVal

func s5*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s5

func `s5=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s5 = newVal

func s6*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s6

func `s6=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s6 = newVal

func s7*(self: Ulong8): Ulong {.inline.} =
  self.anonStruct103.s7

func `s7=`*(self: var Ulong8; newVal: Ulong) {.inline.} =
  self.anonStruct103.s7 = newVal

func lo*(self: Ulong8): Ulong4 {.inline.} =
  self.anonStruct104.lo

func `lo=`*(self: var Ulong8; newVal: Ulong4) {.inline.} =
  self.anonStruct104.lo = newVal

func hi*(self: Ulong8): Ulong4 {.inline.} =
  self.anonStruct104.hi

func `hi=`*(self: var Ulong8; newVal: Ulong4) {.inline.} =
  self.anonStruct104.hi = newVal

type AnonStruct105 {.packed.} = object
  x: Ulong
  y: Ulong
  z: Ulong
  w: Ulong
  spacer4: Ulong
  spacer5: Ulong
  spacer6: Ulong
  spacer7: Ulong
  spacer8: Ulong
  spacer9: Ulong
  sa: Ulong
  sb: Ulong
  sc: Ulong
  sd: Ulong
  se: Ulong
  sf: Ulong
type AnonStruct106 {.packed.} = object
  s0: Ulong
  s1: Ulong
  s2: Ulong
  s3: Ulong
  s4: Ulong
  s5: Ulong
  s6: Ulong
  s7: Ulong
  s8: Ulong
  s9: Ulong
  sAA: Ulong
  sBB: Ulong
  sCC: Ulong
  sDD: Ulong
  sEE: Ulong
  sFF: Ulong
type AnonStruct107 {.packed.} = object
  lo: Ulong8
  hi: Ulong8

type Ulong16* {.bycopy, union.} = object
  ##[A vector of 16 'Ulong's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Ulong`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Ulong`
     `lo, hi: Ulong8`]##
  s*: array[16, Ulong]
  when defined(HardwareDependentUlong2):
    v2*: array[8, HardwareDependentUlong2]
  when defined(HardwareDependentUlong4):
    v4*: array[4, HardwareDependentUlong4]
  when defined(HardwareDependentUlong8):
    v8*: array[2, HardwareDependentUlong8]
  when defined(HardwareDependentUlong16):
    v16*: HardwareDependentUlong16
  anonStruct105: AnonStruct105
  anonStruct106: AnonStruct106
  anonStruct107: AnonStruct107


func x*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.x

func `x=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.x = newVal

func y*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.y

func `y=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.y = newVal

func z*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.z

func `z=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.z = newVal

func w*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.w

func `w=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.w = newVal

func spacer4*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer4

func `spacer4=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer4 = newVal

func spacer5*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer5

func `spacer5=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer5 = newVal

func spacer6*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer6

func `spacer6=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer6 = newVal

func spacer7*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer7

func `spacer7=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer7 = newVal

func spacer8*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer8

func `spacer8=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer8 = newVal

func spacer9*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.spacer9

func `spacer9=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.spacer9 = newVal

func sa*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.sa

func `sa=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.sa = newVal

func sb*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.sb

func `sb=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.sb = newVal

func sc*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.sc

func `sc=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.sc = newVal

func sd*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.sd

func `sd=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.sd = newVal

func se*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.se

func `se=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.se = newVal

func sf*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct105.sf

func `sf=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct105.sf = newVal

func s0*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s0

func `s0=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s0 = newVal

func s1*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s1

func `s1=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s1 = newVal

func s2*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s2

func `s2=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s2 = newVal

func s3*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s3

func `s3=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s3 = newVal

func s4*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s4

func `s4=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s4 = newVal

func s5*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s5

func `s5=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s5 = newVal

func s6*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s6

func `s6=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s6 = newVal

func s7*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s7

func `s7=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s7 = newVal

func s8*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s8

func `s8=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s8 = newVal

func s9*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.s9

func `s9=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.s9 = newVal

func sAA*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sAA

func `sAA=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sAA = newVal

func sBB*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sBB

func `sBB=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sBB = newVal

func sCC*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sCC

func `sCC=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sCC = newVal

func sDD*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sDD

func `sDD=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sDD = newVal

func sEE*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sEE

func `sEE=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sEE = newVal

func sFF*(self: Ulong16): Ulong {.inline.} =
  self.anonStruct106.sFF

func `sFF=`*(self: var Ulong16; newVal: Ulong) {.inline.} =
  self.anonStruct106.sFF = newVal

func lo*(self: Ulong16): Ulong8 {.inline.} =
  self.anonStruct107.lo

func `lo=`*(self: var Ulong16; newVal: Ulong8) {.inline.} =
  self.anonStruct107.lo = newVal

func hi*(self: Ulong16): Ulong8 {.inline.} =
  self.anonStruct107.hi

func `hi=`*(self: var Ulong16; newVal: Ulong8) {.inline.} =
  self.anonStruct107.hi = newVal

type AnonStruct108 {.packed.} = object
  x: Float
  y: Float
type AnonStruct109 {.packed.} = object
  s0: Float
  s1: Float
type AnonStruct110 {.packed.} = object
  lo: Float
  hi: Float

type Float2* {.bycopy, union.} = object
  ##[A vector of 2 'Float's.
     Can be accessed by: `x, y: Float`
     `s0, s1: Float`
     `lo, hi: Float`]##
  s*: array[2, Float]
  when defined(HardwareDependentFloat2):
    v2*: HardwareDependentFloat2
  anonStruct108: AnonStruct108
  anonStruct109: AnonStruct109
  anonStruct110: AnonStruct110


func x*(self: Float2): Float {.inline.} =
  self.anonStruct108.x

func `x=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct108.x = newVal

func y*(self: Float2): Float {.inline.} =
  self.anonStruct108.y

func `y=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct108.y = newVal

func s0*(self: Float2): Float {.inline.} =
  self.anonStruct109.s0

func `s0=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct109.s0 = newVal

func s1*(self: Float2): Float {.inline.} =
  self.anonStruct109.s1

func `s1=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct109.s1 = newVal

func lo*(self: Float2): Float {.inline.} =
  self.anonStruct110.lo

func `lo=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct110.lo = newVal

func hi*(self: Float2): Float {.inline.} =
  self.anonStruct110.hi

func `hi=`*(self: var Float2; newVal: Float) {.inline.} =
  self.anonStruct110.hi = newVal

type AnonStruct111 {.packed.} = object
  x: Float
  y: Float
  z: Float
  w: Float
type AnonStruct112 {.packed.} = object
  s0: Float
  s1: Float
  s2: Float
  s3: Float
type AnonStruct113 {.packed.} = object
  lo: Float2
  hi: Float2

type Float4* {.bycopy, union.} = object
  ##[A vector of 4 'Float's.
     Can be accessed by: `x, y, z, w: Float`
     `s0, s1, s2, s3: Float`
     `lo, hi: Float2`]##
  s*: array[4, Float]
  when defined(HardwareDependentFloat2):
    v2*: array[2, HardwareDependentFloat2]
  when defined(HardwareDependentFloat4):
    v4*: HardwareDependentFloat4
  anonStruct111: AnonStruct111
  anonStruct112: AnonStruct112
  anonStruct113: AnonStruct113


func x*(self: Float4): Float {.inline.} =
  self.anonStruct111.x

func `x=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct111.x = newVal

func y*(self: Float4): Float {.inline.} =
  self.anonStruct111.y

func `y=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct111.y = newVal

func z*(self: Float4): Float {.inline.} =
  self.anonStruct111.z

func `z=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct111.z = newVal

func w*(self: Float4): Float {.inline.} =
  self.anonStruct111.w

func `w=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct111.w = newVal

func s0*(self: Float4): Float {.inline.} =
  self.anonStruct112.s0

func `s0=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct112.s0 = newVal

func s1*(self: Float4): Float {.inline.} =
  self.anonStruct112.s1

func `s1=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct112.s1 = newVal

func s2*(self: Float4): Float {.inline.} =
  self.anonStruct112.s2

func `s2=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct112.s2 = newVal

func s3*(self: Float4): Float {.inline.} =
  self.anonStruct112.s3

func `s3=`*(self: var Float4; newVal: Float) {.inline.} =
  self.anonStruct112.s3 = newVal

func lo*(self: Float4): Float2 {.inline.} =
  self.anonStruct113.lo

func `lo=`*(self: var Float4; newVal: Float2) {.inline.} =
  self.anonStruct113.lo = newVal

func hi*(self: Float4): Float2 {.inline.} =
  self.anonStruct113.hi

func `hi=`*(self: var Float4; newVal: Float2) {.inline.} =
  self.anonStruct113.hi = newVal

type AnonStruct114 {.packed.} = object
  x: Float
  y: Float
  z: Float
  w: Float
type AnonStruct115 {.packed.} = object
  s0: Float
  s1: Float
  s2: Float
  s3: Float
  s4: Float
  s5: Float
  s6: Float
  s7: Float
type AnonStruct116 {.packed.} = object
  lo: Float4
  hi: Float4

type Float8* {.bycopy, union.} = object
  ##[A vector of 8 'Float's.
     Can be accessed by: `x, y, z, w: Float`
     `s0, s1, s2, s3, s4, s5, s6, s7: Float`
     `lo, hi: Float4`]##
  s*: array[8, Float]
  when defined(HardwareDependentFloat2):
    v2*: array[4, HardwareDependentFloat2]
  when defined(HardwareDependentFloat4):
    v4*: array[2, HardwareDependentFloat4]
  when defined(HardwareDependentFloat8):
    v8*: HardwareDependentFloat8
  anonStruct114: AnonStruct114
  anonStruct115: AnonStruct115
  anonStruct116: AnonStruct116


func x*(self: Float8): Float {.inline.} =
  self.anonStruct114.x

func `x=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct114.x = newVal

func y*(self: Float8): Float {.inline.} =
  self.anonStruct114.y

func `y=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct114.y = newVal

func z*(self: Float8): Float {.inline.} =
  self.anonStruct114.z

func `z=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct114.z = newVal

func w*(self: Float8): Float {.inline.} =
  self.anonStruct114.w

func `w=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct114.w = newVal

func s0*(self: Float8): Float {.inline.} =
  self.anonStruct115.s0

func `s0=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s0 = newVal

func s1*(self: Float8): Float {.inline.} =
  self.anonStruct115.s1

func `s1=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s1 = newVal

func s2*(self: Float8): Float {.inline.} =
  self.anonStruct115.s2

func `s2=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s2 = newVal

func s3*(self: Float8): Float {.inline.} =
  self.anonStruct115.s3

func `s3=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s3 = newVal

func s4*(self: Float8): Float {.inline.} =
  self.anonStruct115.s4

func `s4=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s4 = newVal

func s5*(self: Float8): Float {.inline.} =
  self.anonStruct115.s5

func `s5=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s5 = newVal

func s6*(self: Float8): Float {.inline.} =
  self.anonStruct115.s6

func `s6=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s6 = newVal

func s7*(self: Float8): Float {.inline.} =
  self.anonStruct115.s7

func `s7=`*(self: var Float8; newVal: Float) {.inline.} =
  self.anonStruct115.s7 = newVal

func lo*(self: Float8): Float4 {.inline.} =
  self.anonStruct116.lo

func `lo=`*(self: var Float8; newVal: Float4) {.inline.} =
  self.anonStruct116.lo = newVal

func hi*(self: Float8): Float4 {.inline.} =
  self.anonStruct116.hi

func `hi=`*(self: var Float8; newVal: Float4) {.inline.} =
  self.anonStruct116.hi = newVal

type AnonStruct117 {.packed.} = object
  x: Float
  y: Float
  z: Float
  w: Float
  spacer4: Float
  spacer5: Float
  spacer6: Float
  spacer7: Float
  spacer8: Float
  spacer9: Float
  sa: Float
  sb: Float
  sc: Float
  sd: Float
  se: Float
  sf: Float
type AnonStruct118 {.packed.} = object
  s0: Float
  s1: Float
  s2: Float
  s3: Float
  s4: Float
  s5: Float
  s6: Float
  s7: Float
  s8: Float
  s9: Float
  sAA: Float
  sBB: Float
  sCC: Float
  sDD: Float
  sEE: Float
  sFF: Float
type AnonStruct119 {.packed.} = object
  lo: Float8
  hi: Float8

type Float16* {.bycopy, union.} = object
  ##[A vector of 16 'Float's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Float`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Float`
     `lo, hi: Float8`]##
  s*: array[16, Float]
  when defined(HardwareDependentFloat2):
    v2*: array[8, HardwareDependentFloat2]
  when defined(HardwareDependentFloat4):
    v4*: array[4, HardwareDependentFloat4]
  when defined(HardwareDependentFloat8):
    v8*: array[2, HardwareDependentFloat8]
  when defined(HardwareDependentFloat16):
    v16*: HardwareDependentFloat16
  anonStruct117: AnonStruct117
  anonStruct118: AnonStruct118
  anonStruct119: AnonStruct119


func x*(self: Float16): Float {.inline.} =
  self.anonStruct117.x

func `x=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.x = newVal

func y*(self: Float16): Float {.inline.} =
  self.anonStruct117.y

func `y=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.y = newVal

func z*(self: Float16): Float {.inline.} =
  self.anonStruct117.z

func `z=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.z = newVal

func w*(self: Float16): Float {.inline.} =
  self.anonStruct117.w

func `w=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.w = newVal

func spacer4*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer4

func `spacer4=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer4 = newVal

func spacer5*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer5

func `spacer5=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer5 = newVal

func spacer6*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer6

func `spacer6=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer6 = newVal

func spacer7*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer7

func `spacer7=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer7 = newVal

func spacer8*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer8

func `spacer8=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer8 = newVal

func spacer9*(self: Float16): Float {.inline.} =
  self.anonStruct117.spacer9

func `spacer9=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.spacer9 = newVal

func sa*(self: Float16): Float {.inline.} =
  self.anonStruct117.sa

func `sa=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.sa = newVal

func sb*(self: Float16): Float {.inline.} =
  self.anonStruct117.sb

func `sb=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.sb = newVal

func sc*(self: Float16): Float {.inline.} =
  self.anonStruct117.sc

func `sc=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.sc = newVal

func sd*(self: Float16): Float {.inline.} =
  self.anonStruct117.sd

func `sd=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.sd = newVal

func se*(self: Float16): Float {.inline.} =
  self.anonStruct117.se

func `se=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.se = newVal

func sf*(self: Float16): Float {.inline.} =
  self.anonStruct117.sf

func `sf=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct117.sf = newVal

func s0*(self: Float16): Float {.inline.} =
  self.anonStruct118.s0

func `s0=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s0 = newVal

func s1*(self: Float16): Float {.inline.} =
  self.anonStruct118.s1

func `s1=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s1 = newVal

func s2*(self: Float16): Float {.inline.} =
  self.anonStruct118.s2

func `s2=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s2 = newVal

func s3*(self: Float16): Float {.inline.} =
  self.anonStruct118.s3

func `s3=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s3 = newVal

func s4*(self: Float16): Float {.inline.} =
  self.anonStruct118.s4

func `s4=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s4 = newVal

func s5*(self: Float16): Float {.inline.} =
  self.anonStruct118.s5

func `s5=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s5 = newVal

func s6*(self: Float16): Float {.inline.} =
  self.anonStruct118.s6

func `s6=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s6 = newVal

func s7*(self: Float16): Float {.inline.} =
  self.anonStruct118.s7

func `s7=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s7 = newVal

func s8*(self: Float16): Float {.inline.} =
  self.anonStruct118.s8

func `s8=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s8 = newVal

func s9*(self: Float16): Float {.inline.} =
  self.anonStruct118.s9

func `s9=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.s9 = newVal

func sAA*(self: Float16): Float {.inline.} =
  self.anonStruct118.sAA

func `sAA=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sAA = newVal

func sBB*(self: Float16): Float {.inline.} =
  self.anonStruct118.sBB

func `sBB=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sBB = newVal

func sCC*(self: Float16): Float {.inline.} =
  self.anonStruct118.sCC

func `sCC=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sCC = newVal

func sDD*(self: Float16): Float {.inline.} =
  self.anonStruct118.sDD

func `sDD=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sDD = newVal

func sEE*(self: Float16): Float {.inline.} =
  self.anonStruct118.sEE

func `sEE=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sEE = newVal

func sFF*(self: Float16): Float {.inline.} =
  self.anonStruct118.sFF

func `sFF=`*(self: var Float16; newVal: Float) {.inline.} =
  self.anonStruct118.sFF = newVal

func lo*(self: Float16): Float8 {.inline.} =
  self.anonStruct119.lo

func `lo=`*(self: var Float16; newVal: Float8) {.inline.} =
  self.anonStruct119.lo = newVal

func hi*(self: Float16): Float8 {.inline.} =
  self.anonStruct119.hi

func `hi=`*(self: var Float16; newVal: Float8) {.inline.} =
  self.anonStruct119.hi = newVal

type AnonStruct120 {.packed.} = object
  x: Double
  y: Double
type AnonStruct121 {.packed.} = object
  s0: Double
  s1: Double
type AnonStruct122 {.packed.} = object
  lo: Double
  hi: Double

type Double2* {.bycopy, union.} = object
  ##[A vector of 2 'Double's.
     Can be accessed by: `x, y: Double`
     `s0, s1: Double`
     `lo, hi: Double`]##
  s*: array[2, Double]
  when defined(HardwareDependentDouble2):
    v2*: HardwareDependentDouble2
  anonStruct120: AnonStruct120
  anonStruct121: AnonStruct121
  anonStruct122: AnonStruct122


func x*(self: Double2): Double {.inline.} =
  self.anonStruct120.x

func `x=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct120.x = newVal

func y*(self: Double2): Double {.inline.} =
  self.anonStruct120.y

func `y=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct120.y = newVal

func s0*(self: Double2): Double {.inline.} =
  self.anonStruct121.s0

func `s0=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct121.s0 = newVal

func s1*(self: Double2): Double {.inline.} =
  self.anonStruct121.s1

func `s1=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct121.s1 = newVal

func lo*(self: Double2): Double {.inline.} =
  self.anonStruct122.lo

func `lo=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct122.lo = newVal

func hi*(self: Double2): Double {.inline.} =
  self.anonStruct122.hi

func `hi=`*(self: var Double2; newVal: Double) {.inline.} =
  self.anonStruct122.hi = newVal

type AnonStruct123 {.packed.} = object
  x: Double
  y: Double
  z: Double
  w: Double
type AnonStruct124 {.packed.} = object
  s0: Double
  s1: Double
  s2: Double
  s3: Double
type AnonStruct125 {.packed.} = object
  lo: Double2
  hi: Double2

type Double4* {.bycopy, union.} = object
  ##[A vector of 4 'Double's.
     Can be accessed by: `x, y, z, w: Double`
     `s0, s1, s2, s3: Double`
     `lo, hi: Double2`]##
  s*: array[4, Double]
  when defined(HardwareDependentDouble2):
    v2*: array[2, HardwareDependentDouble2]
  when defined(HardwareDependentDouble4):
    v4*: HardwareDependentDouble4
  anonStruct123: AnonStruct123
  anonStruct124: AnonStruct124
  anonStruct125: AnonStruct125


func x*(self: Double4): Double {.inline.} =
  self.anonStruct123.x

func `x=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct123.x = newVal

func y*(self: Double4): Double {.inline.} =
  self.anonStruct123.y

func `y=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct123.y = newVal

func z*(self: Double4): Double {.inline.} =
  self.anonStruct123.z

func `z=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct123.z = newVal

func w*(self: Double4): Double {.inline.} =
  self.anonStruct123.w

func `w=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct123.w = newVal

func s0*(self: Double4): Double {.inline.} =
  self.anonStruct124.s0

func `s0=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct124.s0 = newVal

func s1*(self: Double4): Double {.inline.} =
  self.anonStruct124.s1

func `s1=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct124.s1 = newVal

func s2*(self: Double4): Double {.inline.} =
  self.anonStruct124.s2

func `s2=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct124.s2 = newVal

func s3*(self: Double4): Double {.inline.} =
  self.anonStruct124.s3

func `s3=`*(self: var Double4; newVal: Double) {.inline.} =
  self.anonStruct124.s3 = newVal

func lo*(self: Double4): Double2 {.inline.} =
  self.anonStruct125.lo

func `lo=`*(self: var Double4; newVal: Double2) {.inline.} =
  self.anonStruct125.lo = newVal

func hi*(self: Double4): Double2 {.inline.} =
  self.anonStruct125.hi

func `hi=`*(self: var Double4; newVal: Double2) {.inline.} =
  self.anonStruct125.hi = newVal

type AnonStruct126 {.packed.} = object
  x: Double
  y: Double
  z: Double
  w: Double
type AnonStruct127 {.packed.} = object
  s0: Double
  s1: Double
  s2: Double
  s3: Double
  s4: Double
  s5: Double
  s6: Double
  s7: Double
type AnonStruct128 {.packed.} = object
  lo: Double4
  hi: Double4

type Double8* {.bycopy, union.} = object
  ##[A vector of 8 'Double's.
     Can be accessed by: `x, y, z, w: Double`
     `s0, s1, s2, s3, s4, s5, s6, s7: Double`
     `lo, hi: Double4`]##
  s*: array[8, Double]
  when defined(HardwareDependentDouble2):
    v2*: array[4, HardwareDependentDouble2]
  when defined(HardwareDependentDouble4):
    v4*: array[2, HardwareDependentDouble4]
  when defined(HardwareDependentDouble8):
    v8*: HardwareDependentDouble8
  anonStruct126: AnonStruct126
  anonStruct127: AnonStruct127
  anonStruct128: AnonStruct128


func x*(self: Double8): Double {.inline.} =
  self.anonStruct126.x

func `x=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct126.x = newVal

func y*(self: Double8): Double {.inline.} =
  self.anonStruct126.y

func `y=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct126.y = newVal

func z*(self: Double8): Double {.inline.} =
  self.anonStruct126.z

func `z=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct126.z = newVal

func w*(self: Double8): Double {.inline.} =
  self.anonStruct126.w

func `w=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct126.w = newVal

func s0*(self: Double8): Double {.inline.} =
  self.anonStruct127.s0

func `s0=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s0 = newVal

func s1*(self: Double8): Double {.inline.} =
  self.anonStruct127.s1

func `s1=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s1 = newVal

func s2*(self: Double8): Double {.inline.} =
  self.anonStruct127.s2

func `s2=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s2 = newVal

func s3*(self: Double8): Double {.inline.} =
  self.anonStruct127.s3

func `s3=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s3 = newVal

func s4*(self: Double8): Double {.inline.} =
  self.anonStruct127.s4

func `s4=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s4 = newVal

func s5*(self: Double8): Double {.inline.} =
  self.anonStruct127.s5

func `s5=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s5 = newVal

func s6*(self: Double8): Double {.inline.} =
  self.anonStruct127.s6

func `s6=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s6 = newVal

func s7*(self: Double8): Double {.inline.} =
  self.anonStruct127.s7

func `s7=`*(self: var Double8; newVal: Double) {.inline.} =
  self.anonStruct127.s7 = newVal

func lo*(self: Double8): Double4 {.inline.} =
  self.anonStruct128.lo

func `lo=`*(self: var Double8; newVal: Double4) {.inline.} =
  self.anonStruct128.lo = newVal

func hi*(self: Double8): Double4 {.inline.} =
  self.anonStruct128.hi

func `hi=`*(self: var Double8; newVal: Double4) {.inline.} =
  self.anonStruct128.hi = newVal

type AnonStruct129 {.packed.} = object
  x: Double
  y: Double
  z: Double
  w: Double
  spacer4: Double
  spacer5: Double
  spacer6: Double
  spacer7: Double
  spacer8: Double
  spacer9: Double
  sa: Double
  sb: Double
  sc: Double
  sd: Double
  se: Double
  sf: Double
type AnonStruct130 {.packed.} = object
  s0: Double
  s1: Double
  s2: Double
  s3: Double
  s4: Double
  s5: Double
  s6: Double
  s7: Double
  s8: Double
  s9: Double
  sAA: Double
  sBB: Double
  sCC: Double
  sDD: Double
  sEE: Double
  sFF: Double
type AnonStruct131 {.packed.} = object
  lo: Double8
  hi: Double8

type Double16* {.bycopy, union.} = object
  ##[A vector of 16 'Double's.
     Can be accessed by: `x, y, z, w, spacer4, spacer5, spacer6, spacer7, spacer8, spacer9, sa, sb, sc, sd, se, sf: Double`
     `s0, s1, s2, s3, s4, s5, s6, s7, s8, s9, sAA, sBB, sCC, sDD, sEE, sFF: Double`
     `lo, hi: Double8`]##
  s*: array[16, Double]
  when defined(HardwareDependentDouble2):
    v2*: array[8, HardwareDependentDouble2]
  when defined(HardwareDependentDouble4):
    v4*: array[4, HardwareDependentDouble4]
  when defined(HardwareDependentDouble8):
    v8*: array[2, HardwareDependentDouble8]
  when defined(HardwareDependentDouble16):
    v16*: HardwareDependentDouble16
  anonStruct129: AnonStruct129
  anonStruct130: AnonStruct130
  anonStruct131: AnonStruct131


func x*(self: Double16): Double {.inline.} =
  self.anonStruct129.x

func `x=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.x = newVal

func y*(self: Double16): Double {.inline.} =
  self.anonStruct129.y

func `y=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.y = newVal

func z*(self: Double16): Double {.inline.} =
  self.anonStruct129.z

func `z=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.z = newVal

func w*(self: Double16): Double {.inline.} =
  self.anonStruct129.w

func `w=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.w = newVal

func spacer4*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer4

func `spacer4=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer4 = newVal

func spacer5*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer5

func `spacer5=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer5 = newVal

func spacer6*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer6

func `spacer6=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer6 = newVal

func spacer7*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer7

func `spacer7=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer7 = newVal

func spacer8*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer8

func `spacer8=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer8 = newVal

func spacer9*(self: Double16): Double {.inline.} =
  self.anonStruct129.spacer9

func `spacer9=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.spacer9 = newVal

func sa*(self: Double16): Double {.inline.} =
  self.anonStruct129.sa

func `sa=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.sa = newVal

func sb*(self: Double16): Double {.inline.} =
  self.anonStruct129.sb

func `sb=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.sb = newVal

func sc*(self: Double16): Double {.inline.} =
  self.anonStruct129.sc

func `sc=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.sc = newVal

func sd*(self: Double16): Double {.inline.} =
  self.anonStruct129.sd

func `sd=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.sd = newVal

func se*(self: Double16): Double {.inline.} =
  self.anonStruct129.se

func `se=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.se = newVal

func sf*(self: Double16): Double {.inline.} =
  self.anonStruct129.sf

func `sf=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct129.sf = newVal

func s0*(self: Double16): Double {.inline.} =
  self.anonStruct130.s0

func `s0=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s0 = newVal

func s1*(self: Double16): Double {.inline.} =
  self.anonStruct130.s1

func `s1=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s1 = newVal

func s2*(self: Double16): Double {.inline.} =
  self.anonStruct130.s2

func `s2=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s2 = newVal

func s3*(self: Double16): Double {.inline.} =
  self.anonStruct130.s3

func `s3=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s3 = newVal

func s4*(self: Double16): Double {.inline.} =
  self.anonStruct130.s4

func `s4=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s4 = newVal

func s5*(self: Double16): Double {.inline.} =
  self.anonStruct130.s5

func `s5=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s5 = newVal

func s6*(self: Double16): Double {.inline.} =
  self.anonStruct130.s6

func `s6=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s6 = newVal

func s7*(self: Double16): Double {.inline.} =
  self.anonStruct130.s7

func `s7=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s7 = newVal

func s8*(self: Double16): Double {.inline.} =
  self.anonStruct130.s8

func `s8=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s8 = newVal

func s9*(self: Double16): Double {.inline.} =
  self.anonStruct130.s9

func `s9=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.s9 = newVal

func sAA*(self: Double16): Double {.inline.} =
  self.anonStruct130.sAA

func `sAA=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sAA = newVal

func sBB*(self: Double16): Double {.inline.} =
  self.anonStruct130.sBB

func `sBB=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sBB = newVal

func sCC*(self: Double16): Double {.inline.} =
  self.anonStruct130.sCC

func `sCC=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sCC = newVal

func sDD*(self: Double16): Double {.inline.} =
  self.anonStruct130.sDD

func `sDD=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sDD = newVal

func sEE*(self: Double16): Double {.inline.} =
  self.anonStruct130.sEE

func `sEE=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sEE = newVal

func sFF*(self: Double16): Double {.inline.} =
  self.anonStruct130.sFF

func `sFF=`*(self: var Double16; newVal: Double) {.inline.} =
  self.anonStruct130.sFF = newVal

func lo*(self: Double16): Double8 {.inline.} =
  self.anonStruct131.lo

func `lo=`*(self: var Double16; newVal: Double8) {.inline.} =
  self.anonStruct131.lo = newVal

func hi*(self: Double16): Double8 {.inline.} =
  self.anonStruct131.hi

func `hi=`*(self: var Double16; newVal: Double8) {.inline.} =
  self.anonStruct131.hi = newVal


type
  SharedApplicationScalarDataTypes* = Char | Uchar | Short | Ushort | Int |
    Uint | Long | Ulong | Half | Float | Double
  ScalarTypes* = SharedApplicationScalarDataTypes

  SupportedApplicationVectorDataTypes* = Char2 | Char4 | Char8 | Char16 |
    Uchar2 | Uchar4 | Uchar8 | Uchar16 | Short2 | Short4 | Short8 | Short16 |
    Ushort2 | Ushort4 | Ushort8 | Ushort16 | Int2 | Int4 | Int8 | Int16 |
    Uint2 | Uint4 | Uint8 | Uint16 | Long2 | Long4 | Long8 | Long16 |
    Ulong2 | Ulong4 | Ulong8 | Ulong16 | Half2 | Half4 | Half8 | Half16 |
    Float2 | Float4 | Float8 | Float16 | Double2 | Double4 | Double8 |
    Double16
  VectorTypes* = SupportedApplicationVectorDataTypes



##  Macro to facilitate debugging
##  Usage:
##    Place CL_PROGRAM_STRING_DEBUG_INFO on the line before the first line of your source.
##    The first line ends with:   CL_PROGRAM_STRING_DEBUG_INFO \"
##    Each line thereafter of OpenCL C source must end with: \n\
##    The last line ends in ";
##
##    Example:
##
##    const char *my_program = CL_PROGRAM_STRING_DEBUG_INFO "\
##    kernel void foo( int a, float * b )             \n\
##    {                                               \n\
##       // my comment                                \n\
##       *b[ get_global_id(0)] = a;                   \n\
##    }                                               \n\
##    ";
##
##  This should correctly set up the line, (column) and file information for your source
##  string so you can do source level debugging.
##
##  #define  __CL_STRINGIFY( _x )               # _x
##  #define  _CL_STRINGIFY( _x )                __CL_STRINGIFY( _x )
##  #define  CL_PROGRAM_STRING_DEBUG_INFO       "#line "  _CL_STRINGIFY(__LINE__) " \"" __FILE__ "\" \n\n"

# when defined(WIN32) and defined(MSC_VER) and __CL_HAS_ANON_STRUCT__:
#   discard
