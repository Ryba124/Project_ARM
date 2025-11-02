# Toolchain file for Clang cross-compiling to a Cortex-M target

# Specify the Clang compiler
set(CMAKE_C_COMPILER "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/clang.exe")
set(CMAKE_CXX_COMPILER "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/clang++.exe")

# Specify the target architecture (Cortex-M, adjust for your specific model)
set(CMAKE_SYSTEM_NAME "Generic")
set(CMAKE_SYSTEM_PROCESSOR "arm")

# Specify the target platform architecture (example for cortex-m4)
set(CMAKE_C_FLAGS "--target=armv7m-none-eabi -mfpu=none -fno-exceptions -fno-rtti -c -O0 -g -fprofile-instr-generate=C:/Logs/lo.txt -fcoverage-mapping") #  -fprofile-instr-generate=C:/Logs/log.txt -fcoverage-mapping
set(CMAKE_CXX_FLAGS "--target=armv7m-none-eabi -mfpu=none -fno-exceptions -fno-rtti -c -O0 -g -fprofile-instr-generate=C:/Logs/lo.txt -fcoverage-mapping") # -fprofile-instr-generate=C:/Logs/log.txt -fcoverage-mapping

# Specify the sysroot (can be empty if you don't have a sysroot, adjust for your setup)
#set(CMAKE_SYSROOT "")

# Set the path to the ARM GCC toolchain (for linking, etc., if you use it)
set(CMAKE_LINKER "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/ld.lld.exe")
#SET(CMAKE_C_LINKER "/usr/bin/llvm-ld")
#SET(CMAKE_CXX_LINKER "/usr/bin/llvm-ld")

SET(CMAKE_C_LINK_EXECUTABLE "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/ld.lld.exe <OBJECTS> -o  <TARGET> <CMAKE_C_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")
SET(CMAKE_CXX_LINK_EXECUTABLE "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/clang.exe <OBJECTS> -o  <TARGET> <CMAKE_CXX_LINK_FLAGS> <LINK_FLAGS> <LINK_LIBRARIES>")
SET(CMAKE_CXX_LINK_FLAGS  "--target=armv7m-none-eabi -mfpu=none -fno-exceptions -fno-rtti -nostartfiles -lcrt0-semihost -lsemihost -T picolibcpp.ld -v -fprofile-instr-generate=C:/Logs/lo.txt -fprofile-instr-generate=C:/Logs/lo.txt -fcoverage-mapping") #  -fprofile-instr-generate=C:/Logs/log.txt
# Specify the assembler
set(CMAKE_ASM_COMPILER "C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/bin/clang.exe")

# Tell CMake to ignore Visual Studio and MSVC toolchain
#set(CMAKE_GENERATOR Ninja)  # This will force CMake to use Ninja instead of MSBuild
#set(CMAKE_MAKE_PROGRAM "C:/ninja-win/ninja.exe")  # Set Ninja as the build tool#


# Specify the build type (optional, you can specify Debug, Release, etc.)
set(CMAKE_BUILD_TYPE "Debug")

# Set the binary output format (for Cortex-M, generally ELF or BIN)
set(CMAKE_EXECUTABLE_SUFFIX ".elf")
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -ffreestanding -nostdlib -fno-builtin -fomit-frame-pointer")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -ffreestanding -nostdlib -fno-builtin -fomit-frame-pointer")

# Path to any standard libraries (optional, you may link your own)
#set(CMAKE_FIND_ROOT_PATH "")

# Set the path to the Clang include directories (standard libraries and headers)
include_directories("C:/ATFE/ATfE-21.1.1-Windows-x86_64/ATfE-21.1.1-Windows-x86_64/lib/clang/21/include")

# Optional: add other necessary flags like debugging options or optimization
#set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -g")
#set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O2 -g")

# Set output directories (optional, depending on your needs)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

# Optionally, you can set any additional flags or tools as needed.
