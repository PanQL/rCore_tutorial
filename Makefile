DOCKER_NAME ?= panqinglin/tutorial
.PHONY: docker build_docker
all:
	make -C usr user_img
	make -C os build
run:
	make -C usr user_img
	make -C os run
clean:
	make -C usr clean
	make -C os clean
env:
	make -C os env
docker:
	docker run -it --mount type=bind,source=$(shell pwd),destination=/mnt ${DOCKER_NAME}

build_docker: qemu-4.1.1.tar.xz
	docker build -t ${DOCKER_NAME} .
	rm qemu-4.1.1.tar.xz

qemu-4.1.1.tar.xz:
	wget https://download.qemu.org/qemu-4.1.1.tar.xz

