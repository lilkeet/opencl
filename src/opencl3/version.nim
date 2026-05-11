## *****************************************************************************
##  Copyright (c) 2018-2020 The Khronos Group Inc.
##
##  Licensed under the Apache License, ApiVersion 2.0 (the "License");
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

##[This module handles verison control, via the intdefine const named
   `TargetOpenClVersion`. Pass the nim compiler `-d:TargetOpenClVersion=???`
   where the value is the desired opencl version times 100.

   The version defaults to 3.0 (300).

   Previous version apis are still available from new ones, except for
   deprecated stuff. Enable deprecated api by passing the nim compiler
   `-d:UseDeprecatedOpenCl?_?Apis=true/false` where the value is the desired
   opencl version.
   ]##

import
  std / [setutils, sequtils]

#  Detect which version to target
const TargetOpenClVersion {.intdefine.} = 300


#  OpenCL ApiVersion

type OpenClVersion* = enum
  opencl1_0 = 100
  opencl1_1 = 110
  opencl1_2 = 120
  opencl2_0 = 200
  opencl2_1 = 210
  opencl2_2 = 220
  opencl3_0 = 300

const ApiVersion* =
  when TargetOpenClVersion in OpenClVersion.fullSet.mapIt(it.ord):
    OpenClVersion(TargetOpenClVersion)
  else:
    {.warning: "TargetOpenClApiVersion is not a valid value (100, 110, 120, " &
      "200, 210, 220, 300). Defaulting to 300 (OpenCL 3.0)".}
    opencl3_0

#  Allow deprecated APIs for older OpenCL versions.
const
  UseDeprecatedOpenCl2_2Apis* {.booldefine.} =
    when ApiVersion == opencl2_2: true
    else: false

  UseDeprecatedOpenCl2_1Apis* {.booldefine.} =
    when ApiVersion == opencl2_1: true
    else: false

  UseDeprecatedOpenCl2_0Apis* {.booldefine.} =
    when ApiVersion == opencl2_0: true
    else: false

  UseDeprecatedOpenCl1_2Apis* {.booldefine.} =
    when ApiVersion == opencl1_2: true
    else: false

  UseDeprecatedOpenCl1_1Apis* {.booldefine.} =
    when ApiVersion == opencl1_1: true
    else: false

  UseDeprecatedOpenCl1_0Apis* {.booldefine.} =
    when ApiVersion == opencl1_0: true
    else: false
