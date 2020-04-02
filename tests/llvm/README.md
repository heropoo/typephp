## clang

```sh
clang file.c -fsyntax-only # (check for correctness) 代码正确性检查

clang file.c -S -emit-llvm -o - # (print out unoptimized llvm code) 输出未优化的llvm代码

clang -fomit-frame-pointer -O3 -S -o - t.c # On x86_64

clang file.c -S -emit-llvm -o - -O3

clang file.c -S -O3 -o - # (output native machine code)
```

Preprocessing 预处理
```sh
clang ~/t.c -E
```

# llvm tool chain
```sh
# compile the C file into an LLVM bitcode file
clang -O3 -emit-llvm hello.c -c -o hello.bc

# Invoke the LLVM JIT
lli hello.bc

# Use the llvm-dis utility to take a look at the LLVM assembly code:
llvm-dis < hello.bc | less

# Compile the program to native assembly using the LLC code generator
llc hello.bc -o hello.s

# Assemble the native assembly language file into a program
gcc hello.s -o hello.native # or use clang 
```
