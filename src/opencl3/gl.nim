## *****************************************************************************
##  Copyright (c) 2008-2023 The Khronos Group Inc.
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

##
## * This header is generated from the Khronos OpenCL XML API Registry.
##

import
  ./[cl, platform, version],
  ./private/[climport]

#  CL_NO_PROTOTYPES implies CL_NO_EXTENSION_PROTOTYPES:

# when defined(no_Prototypes) and not defined(no_Extension_Prototypes):
#   discard
#  CL_NO_EXTENSION_PROTOTYPES implies
#    CL_NO_ICD_DISPATCH_EXTENSION_PROTOTYPES and
#    CL_NO_NON_ICD_DISPATCH_EXTENSION_PROTOTYPES:

# when defined(no_Extension_Prototypes) and
#     not defined(no_Icd_Dispatch_Extension_Prototypes):
#   discard
# when defined(no_Extension_Prototypes) and
#     not defined(no_Non_Icd_Dispatch_Extension_Prototypes):
#   discard
# *************************************************************
#  cl_khr_gl_sharing
# *************************************************************

const
  KhrGlSharing* = true
  KHR_GL_SHARING_EXTENSION_NAME* = "cl_khr_gl_sharing"
#[
type
  GlContextInfo* = Uint]#

#  Error codes

# const
#   INVALID_GL_SHAREGROUP_REFERENCE* = -1000 TODO implement in cl via version

#  cl_gl_context_info
type ContextInfo* {.size: sizeOf(Uint), pure.} = enum
  CURRENT_DEVICE_FOR_GL_CONTEXT = 0x2006
  DEVICES_FOR_GL_CONTEXT = 0x2007

#  Additional cl_context_properties
type ContextProperty* {.size: sizeof(intptr_t), pure.} = enum
  GL_CONTEXT = 0x2008
  EGL_DISPLAY = 0x2009
  GLX_DISPLAY = 0x200A
  WGL_HDC = 0x200B
  CGL_SHAREGROUP = 0x200C

# type
#   GlObjectType* = Uint
#   GlTextureInfo* = Uint
#   GlPlatformInfo* = Uint

#  cl_gl_object_type

when ApiVersion >= opencl1_2:
  #  cl_gl_object_type
  type ObjectType* {.size: sizeof(Uint), pure.} = enum
    BUFFER = 0x2000
    TEXTURE2D = 0x2001
    TEXTURE3D = 0x2002
    RENDERBUFFER = 0x2003
    TEXTURE2D_ARRAY = 0x200E
    TEXTURE1D = 0x200F
    TEXTURE1D_ARRAY = 0x2010
    TEXTURE_BUFFER = 0x2011

else:
  type ObjectType* {.size: sizeof(Uint), pure.} = enum
    BUFFER = 0x2000
    TEXTURE2D = 0x2001
    TEXTURE3D = 0x2002
    RENDERBUFFER = 0x2003

#  cl_gl_texture_info
type TextureInfo* {.size: sizeof(Uint), pure.} = enum
  TEXTURE_TARGET = 0x2004
  MIPMAP_LEVEL = 0x2005
  NUM_SAMPLES = 0x2012

# type
#   GetGLContextInfoKHR_t* = proc (properties: ptr ContextProperties;
#                               paramName: GlContextInfo; paramValueSize: csize_t;
#                               paramValue: pointer; paramValueSizeRet: ptr csize_t): int
#   GetGLContextInfoKHR_fn* = ptr GetGLContextInfoKHR_t
#   CreateFromGLBufferT* = proc (context: Context; flags: set[MemFlag]; bufobj: GlUint;
#                             errcodeRet: ptr ErrorCode): Mem
#   CreateFromGLBufferFn* = ptr CreateFromGLBufferT


proc getGLContextInfo*[T](
  properties: ptr UncheckedArray[ContextCreationPair]; paramName: ContextInfo;
  paramValueSize: csize_t;
  paramValue: ptr T; paramValueSizeRet: ptr csize_t): ErrorCode {.climport.}
proc getGLContextInfo*[T](
  properties: ptr UncheckedArray[ContextCreationPair]; paramName: ContextInfo;
  paramValueSize: csize_t;
  paramValue: out T; paramValueSizeRet: out csize_t): ErrorCode {.climport.}
proc getGLContextInfo*[T](
  properties: ptr UncheckedArray[ContextCreationPair]; paramName: ContextInfo;
  paramValueSize: csize_t;
  paramValue: ptr T; paramValueSizeRet: out csize_t): ErrorCode {.climport.}
proc getGLContextInfo*[T](
  properties: ptr UncheckedArray[ContextCreationPair]; paramName: ContextInfo;
  paramValueSize: csize_t;
  paramValue: out T; paramValueSizeRet: ptr csize_t): ErrorCode {.climport.}

proc createFromGLBuffer*(
  context: Context; flags: set[MemFlag]; bufobj: GlUint;
  errcodeRet: ptr ErrorCode): Mem {.climport.}
proc createFromGLBuffer*(
  context: Context; flags: set[MemFlag]; bufobj: GlUint;
  errcodeRet: out ErrorCode): Mem {.climport.}


when ApiVersion >= opencl1_2:
  proc createFromGLTexture*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: ptr ErrorCode): Mem {.climport.}
  proc createFromGLTexture*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: out ErrorCode): Mem {.climport.}


proc createFromGLRenderbuffer*(
  context: Context; flags: set[MemFlag]; renderbuffer: GlUint;
  errcodeRet: ptr ErrorCode): Mem {.climport.}
proc createFromGLRenderbuffer*(
  context: Context; flags: set[MemFlag]; renderbuffer: GlUint;
  errcodeRet: out ErrorCode): Mem {.climport.}

proc getGLObjectInfo*(
  memobj: Mem; glObjectType: ptr ObjectType;
  glObjectName: ptr GlUint): ErrorCode {.climport.}



proc getGLTextureInfo*(
  memobj: Mem; paramName: TextureInfo; paramValueSize: csize_t;
  paramValue: pointer; paramValueSizeRet: ptr csize_t): ErrorCode {.climport.}
proc getGLTextureInfo*(
  memobj: Mem; paramName: TextureInfo; paramValueSize: csize_t;
  paramValue: pointer; paramValueSizeRet: out csize_t): ErrorCode {.climport.}


proc enqueueAcquireGLObjects*(
  commandQueue: CommandQueue; numObjects: Uint;
  memObjects: ptr UncheckedArray[Mem]; numEventsInWaitList: Uint;
  eventWaitList: ptr UncheckedArray[Event]; event: ptr Event): int {.climport.}


proc enqueueReleaseGLObjects*(
  commandQueue: CommandQueue; numObjects: Uint;
  memObjects: ptr UncheckedArray[Mem]; numEventsInWaitList: Uint;
  eventWaitList: ptr UncheckedArray[Event]; event: ptr Event): int {.climport.}



#  OpenCL 1.0 APIs that were deprecated in OpenCL 1.2
when UseDeprecatedOpenCl1_1Apis:
  proc createFromGLTexture2D*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: ptr ErrorCode): Mem {.climport.}
  proc createFromGLTexture2D*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: out ErrorCode): Mem {.climport.}

  proc createFromGLTexture3D*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: ptr ErrorCode): Mem {.climport.}
  proc createFromGLTexture3D*(
    context: Context; flags: set[MemFlag]; target: GlEnum; miplevel: GlInt;
    texture: GlUint; errcodeRet: out ErrorCode): Mem {.climport.}

# *************************************************************
#  cl_khr_gl_event
# *************************************************************

const
  khrGlEvent* = 1
  KHR_GL_EVENT_EXTENSION_NAME* = "cl_khr_gl_event"

type
  SyncObj {.noDecl, incompleteStruct.} = object
  Sync* = ptr SyncObj

#  cl_command_type TODO implement in cl via version

const
  COMMAND_GL_FENCE_SYNC_OBJECT_KHR* = 0x200D

# type
#   CreateEventFromSyncKHR_t* = proc (context: Context; sync: Sync;
#                                    errcodeRet: ptr ErrorCode): Event
#   CreateEventFromSyncKHR_fn* = ptr CreateEventFromSyncKHR_t

proc createEventFromSyncKHR*(
  context: Context; sync: Sync; errcodeRet: ptr ErrorCode): Event {.climport.}
proc createEventFromSyncKHR*(
  context: Context; sync: Sync; errcodeRet: out ErrorCode): Event {.climport.}



## *************************************************************
##  cl_khr_gl_depth_images
## *************************************************************

const
  khrGlDepthImages* = 1
  KHR_GL_DEPTH_IMAGES_EXTENSION_NAME* = "cl_khr_gl_depth_images"

##  cl_channel_order

const
  DEPTH_STENCIL* = 0x10BE

##  cl_channel_type

const
  UNORM_INT24* = 0x10DF

## *************************************************************
##  cl_khr_gl_msaa_sharing
## *************************************************************

const
  khrGlMsaaSharing* = 1
  KHR_GL_MSAA_SHARING_EXTENSION_NAME* = "cl_khr_gl_msaa_sharing"

#  cl_gl_texture_info

# const
#   GL_NUM_SAMPLES* = 0x2012

# *************************************************************
#  cl_intel_sharing_format_query_gl
# *************************************************************

const
  intelSharingFormatQueryGl* = 1
  INTEL_SHARING_FORMAT_QUERY_GL_EXTENSION_NAME* = "cl_intel_sharing_format_query_gl"

#  when cl_khr_gl_sharing is supported

type
  GetSupportedGLTextureFormatsINTEL_t* = proc (context: Context; flags: set[MemFlag];
      imageType: MemObjectType; numEntries: Uint; glFormats: ptr GlEnum;
      numTextureFormats: ptr Uint): int
  GetSupportedGLTextureFormatsINTEL_fn* = ptr GetSupportedGLTextureFormatsINTEL_t

proc getSupportedGLTextureFormatsINTEL*(
  context: Context; flags: set[MemFlag]; imageType: MemObjectType;
  numEntries: Uint; glFormats: ptr UncheckedArray[GlEnum];
  numTextureFormats: ptr Uint): int {.climport.}
proc getSupportedGLTextureFormatsINTEL*(
  context: Context; flags: set[MemFlag]; imageType: MemObjectType;
  numEntries: Uint; glFormats: ptr UncheckedArray[GlEnum];
  numTextureFormats: out Uint): int {.climport.}
