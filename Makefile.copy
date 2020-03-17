CC=clang
CXX=clang++
LLVMCONFIG=llvm-config
CFLAGES=-Wall -g
CPPFLAGS = `$(LLVMCONFIG) --cppflags` -std=c++11 -g
LDFLAGS = `$(LLVMCONFIG) --ldflags` -lpthread -ldl -lz -rdynamic

SRC_PATH=./src
BUILD_PATH=./build

#all: typephp

typephp: $(SRC_PATH)/main.cpp
	mkdir -p $(BUILD_PATH)
	$(CXX) $(SRC_PATH)/main.cpp -o $(BUILD_PATH)/typephp

test:
	echo 'todo test'

clean:
	- rm -rf build/*
