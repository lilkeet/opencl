 
## This module handles linker options that need passed.

import
  std/[macrocache, macros, genAsts]

macro passLinkerOptions*() =
  ## Passes the neccessary options to the linker to support OpenCL.
  ## Call this as many times as you like: this will only pass the options once.
  const PassLinkerCalledCount = CacheCounter"passLinkerCalledCount"

  result = newEmptyNode()

  if PassLinkerCalledCount.value == 0:
    inc PassLinkerCalledCount
    result = genAst:
      when defined(macosx):
        {.passL: "-framework OpenCL".}
