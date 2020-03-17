all: cmake
	cd build && make
	cd ..

cmake:
	mkdir -p build
	cd ./build && cmake ..
	cd ..

clean:
	- rm -rf build