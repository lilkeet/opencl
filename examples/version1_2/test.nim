
import
  ../../src/opencl3/[cl, platform],
  ../../src/opencl3

# OpenCL kernel to perform an element-wise addition 
const
  programSource = """__kernel
void vecadd(__global int *A,
            __global int *B,
            __global int *C)
{
   int idx = get_global_id(0);
   C[idx] = A[idx] + B[idx];
}
"""

const elements = 2048
type PArr = ptr array[elements, Int]

proc main() =
  var A, B, C: PArr
  let datasize: csize_t = sizeof(Int)*elements

  A = cast[PArr](alloc(datasize))
  B = cast[PArr](alloc(datasize))
  C = cast[PArr](alloc(datasize))

  for i in (Int 0) ..< elements.Int:
    A[i] = Int i
    B[i] = Int i

  var numPlatforms: Uint
  check getPlatformIDs(0, nil, addr numPlatforms)

  # Allocate enough space for each platform
  var platforms: array[64, PlatformId]
  
  check getPlatformIDs(numPlatforms, cast[ptr UncheckedArray[Platform_id]](addr platforms[0]), nil)

  var numDevices: Uint
  check getDeviceIDs(platforms[0], DeviceTypeAll, 0,
                     nil, addr numDevices)

  # Allocate enough space for each device
  var devices: array[64, DeviceId]

  # Fill in the devices
  check getDeviceIDs(platforms[0], DeviceTypeAll,
                     numDevices, cast[ptr UncheckedArray[DeviceId]](addr devices[0]), nil)

  # Create a context and associate it with the devices
  var status: ErrorCode
  var context = createContext(nil, numDevices,
    cast[ptr UncheckedArray[DeviceId]](addr devices[0]), nil, nil, addr status)
  check status

  # Create a command queue and associate it with the device
  var cmdQueue = createCommandQueue(context, devices[0], {}, addr status)
  check status

  # Create a buffer object that will contain the data from the host array A
  var bufA = createBuffer(context, {MemFlag.READ_ONLY}, datasize, nil,
    addr status)
  check status

  # Create a buffer object that will contain the data
  # from the host array B
  var bufB = createBuffer(context, {MemFlag.READ_ONLY}, datasize, nil,
    addr status)
  check status

  # Create a buffer object that will hold the output data
  var bufC = createBuffer(context, {MemFlag.WRITE_ONLY}, datasize, nil,
    addr status)
  check status

  # Write input array A to the device buffer bufferA
  check enqueueWriteBuffer(cmdQueue, bufA, FALSE, 0, datasize, A, 0, nil, nil)

  # Write input array B to the device buffer bufferB
  check enqueueWriteBuffer(cmdQueue, bufB, FALSE, 0, datasize, B, 0, nil, nil)

  # Create a program with source code
  var lines = [cstring(programSource)]
  var program = createProgramWithSource(context, 1,
      cast[cstringArray](addr lines), nil, addr status)
  check status

  # Build (compile) the program for the device
  check buildProgram(program, numDevices, cast[ptr UncheckedArray[DeviceId]](addr devices),
                     nil, nil, nil)

  # Create the vector addition kernel
  var kernel = createKernel(program, "vecadd", addr status)
  check status

  # Associate the input and output buffers with the kernel
  check setKernelArg(kernel, 0, csize_t sizeof(Mem), addr bufA)
  check setKernelArg(kernel, 1, csize_t sizeof(Mem), addr bufB)
  check setKernelArg(kernel, 2, csize_t sizeof(Mem), addr bufC)

  # Define an index space (global work size) of work items for execution. A
  # workgroup size (local work size) is not required, but can be used.
  var globalWorkSize: array[1, csize_t]

  # There are 'elements' work-items
  globalWorkSize[0] = elements

  # Execute the kernel for execution
  check enqueueNDRangeKernel(cmdQueue, kernel, 1, nil,
    cast[ptr UncheckedArray[csize_t]](addr globalWorkSize), nil, 0, nil, nil)

  # Read the device output buffer to the host output array
  check enqueueReadBuffer(cmdQueue, bufC, TRUE, 0, datasize, C, 0, nil, nil)

  # Verify the output
  var result = true
  for i in 0 ..< elements:
    if C[i] != i+i:
      result = false
      break
  echo "output is ", result

  check releaseKernel(kernel)
  check releaseProgram(program)
  check releaseCommandQueue(cmdQueue)
  check releaseMemObject(bufA)
  check releaseMemObject(bufB)
  check releaseMemObject(bufC)
  check releaseContext(context)

  dealloc(A)
  dealloc(B)
  dealloc(C)

main()
