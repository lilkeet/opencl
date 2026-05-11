## *****************************************************************************
##  Copyright (c) 2008-2021 The Khronos Group Inc.
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

# import
#   ./[version, platform, cl, cl_gl, cl_ext]
#
# export version, platform, cl, cl_gl, cl_ext


import
  ./opencl3/[version, platform, cl]

export version, platform, cl


type OpenClError* = object of IOError ## exception raised by 'check'


proc raiseOpenClError*(x: ErrorCode) {.noinline, noReturn,
                                      raises: [OpenClError].} =
  raise newException(OpenClError, $x & " " & $int(x))

func check*(a: ErrorCode) =
  if a != ErrorCode.Success: raiseOpenClError(a)
