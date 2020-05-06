all: cmake
	cd build && make
	cd ..

cmake:
	mkdir -p build
	cd ./build && cmake ..
	cd ..

run: all
	./build/typephp

clean:
	- rm -rf build
	- rm -rf src/version.h