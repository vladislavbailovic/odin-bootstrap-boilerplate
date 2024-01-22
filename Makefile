ifndef FORCE_PULL
	ODIN_BUILTIN := $(shell command -v odin 2> /dev/null)
endif

ifndef ODIN_BUILTIN
	ODIN = docker run --rm --name odin \
		--volume $(shell readlink -f ./src):/app/src \
		--volume $(shell readlink -f ./build):/app/build \
		--workdir /app \
		odin
else
	ODIN = odin
endif

help: odin
	$(ODIN) help run

run: odin src/*
	$(ODIN) run src/main.odin -file \
		-out:./build/main \
		-extra-linker-flags:-static

clean:
	-rm build/*
	-rm build/.built-odin-version

odin: Dockerfile build/.built-odin-version
ifdef FORCE_PULL
	-rm build/.built-odin-version
	make build/.built-odin-version
endif

build/.built-odin-version:
ifndef ODIN_BUILTIN
	-mkdir build
	docker build --tag odin .
endif
	$(ODIN) version > $@
