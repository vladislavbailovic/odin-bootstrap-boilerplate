ODIN=docker run --rm --name odin \
	--volume $(shell readlink -f ./src):/app/src \
	--volume $(shell readlink -f ./build):/app/build \
	--workdir /app/src \
	odin

help: odin
	$(ODIN) help run

version: odin
	$(ODIN) version

run: odin src/*
	$(ODIN) run main.odin -file -out:/app/build/main

odin: Dockerfile build/.built-odin
	# Maybe building odin docker image

build/.built-odin:
	-mkdir build
	docker build --tag odin .
	touch $@
