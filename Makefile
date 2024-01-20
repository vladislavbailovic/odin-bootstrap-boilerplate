ODIN=docker run --rm --name odin \
	--volume $(shell readlink -f ./src):/app/src \
	--workdir /app/src \
	odin

version: odin
	$(ODIN) version

run: odin src/*
	$(ODIN) run main.odin -file

odin: Dockerfile build/built-odin
	# Maybe building odin docker image

build/built-odin:
	-mkdir build
	docker build --tag odin .
	touch $@
