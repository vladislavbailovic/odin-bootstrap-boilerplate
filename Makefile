ODIN=docker run --rm --name odin \
	--volume $(shell readlink -f ./src):/app/src \
	--volume $(shell readlink -f ./build):/app/build \
	--workdir /app/src \
	odin

help: odin
	$(ODIN) help run

run: odin src/*
	$(ODIN) run main.odin -file \
		-out:/app/build/main \
		-extra-linker-flags:-static

odin: Dockerfile build/.built-odin-version
	# Maybe building odin docker image

build/.built-odin-version:
	-mkdir build
	docker build --tag odin .
	$(ODIN) version > $@
