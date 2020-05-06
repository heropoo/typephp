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

set(GIT_COMMIT_HASH "")
set(BRANGIT_CH_NAME "")
set(GIT_TAG_NAME, "")
# execute_process(
#    COMMAND bash "-c" "git log|head -n 1|awk '{printf $2}'"
#    OUTPUT_VARIABLE GIT_COMMIT
# )
# add_definitions(-DGIT_COMMIT_SHA1="${GIT_COMMIT}")

find_package(Git QUIET)
if(GIT_FOUND)
execute_process(
    COMMAND ${GIT_EXECUTABLE} log -1 --pretty=format:%h
    OUTPUT_VARIABLE GIT_COMMIT_HASH
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)
execute_process(
    COMMAND ${GIT_EXECUTABLE} symbolic-ref --short -q HEAD
    OUTPUT_VARIABLE GIT_BRANCH_NAME
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

execute_process(
    COMMAND bash "-c" "git log -1 --decorate=short --oneline|grep -Eo 'tag: (.*)[,)]+'|awk '{print $2}'|sed 's/)//g'|sed 's/,//g'"
    OUTPUT_VARIABLE GIT_TAG_NAME
    OUTPUT_STRIP_TRAILING_WHITESPACE
    ERROR_QUIET
    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
)

configure_file(
  ${CMAKE_CURRENT_SOURCE_DIR}/version.h.ini
  #${CMAKE_BINARY_DIR}/version.h
  ${CMAKE_CURRENT_SOURCE_DIR}/src/version.h
  @ONLY
)

endif()

message(STATUS "Git version is ${GIT_BRANCH_NAME}-${GIT_COMMIT_HASH}-${GIT_TAG_NAME}")
#add_definitions(-DGIT_COMMIT_SHA1="${COMMIT_HASH}")

# 指定生成目标
add_executable(typephp ${DIR_SRCS})

# 添加链接库
# target_link_libraries(Demo MathFunctions)%