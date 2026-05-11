 
import
  std / [macros, strformat, strutils, with],
  ./[linker]


macro climport*(procDecl: untyped): untyped =
  ## Use this macro as a pragma on OpenCL procs that you want to import.
  ## It adds all the appropriate pragmas and compiler/linker options
  ## so that you don't have to.
  procDecl.expectKind nnkProcDef

  let
    nimName = procDecl.name.strVal
    cName = fmt"cl{nimName[0].toUpperAscii}{nimName[1..^1]}"

  let pragma = newTree(nnkPragma, ident"sideEffect", ident"stdcall",
    newColonExpr(ident"importc", newLit(cName)))
  pragma.setLineInfo procDecl.lineInfoObj

  when defined(windows):
    pragma.add newColonExpr(ident"dynlib",  newLit("opencl.dll"))
  elif defined(macosx):
    discard "handled by linker module"
  else:
    # pragma.add newColonExpr(ident"dynlib",  newLit("libOpenCL.so")) file:///lib/x86_64-linux-gnu/intel-opencl/libigdrcl.so
    pragma.add newColonExpr(ident"dynlib",  newLit("libOpenCL.so"))

  procDecl.pragma = pragma

  result = newNimNode(nnkStmtList, procDecl)
  with result:
    add newCall(bindSym "passLinkerOptions")
    add procDecl
