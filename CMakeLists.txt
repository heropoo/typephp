# CMake 最低版本号要求
cmake_minimum_required (VERSION 2.8)

set(CMAKE_C_COMPILER "clang")
set(CMAKE_CXX_COMPILER "clang++")

# 项目信息
project (TypePHP)

# 查找目录下的所有源文件
# 并将名称保存到 DIR_SRCS 变量
aux_source_directory(./src DIR_SRCS)

# 添加 math 子目录
# add_subdirectory(math)

execute_process(
    COMMAND bash "-c" "git log|head -n 1|awk '{printf $2}'"
    OUTPUT_VARIABLE GIT_COMMIT
)
add_definitions(-DGIT_COMMIT_SHA1="${GIT_COMMIT}")

# 指定生成目标
add_executable(typephp ${DIR_SRCS})

# 添加链接库
# target_link_libraries(Demo MathFunctions)%