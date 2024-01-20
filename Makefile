ODIN=docker run --rm --name odin \
	--volume $(shell readlink -f ./src):/app/src \
	--workdir /app/src \
	odin

all: src/* Dockerfile
	docker build --tag odin .
	$(ODIN) run main.odin -file
