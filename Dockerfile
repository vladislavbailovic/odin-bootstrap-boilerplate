FROM ubuntu:noble

RUN apt-get update && apt-get install -y \
	git clang llvm libx32stdc++-12-dev make \
&& rm -rf /var/lib/apt/lists/*

RUN mkdir /app && cd app && git clone --depth=1 https://github.com/odin-lang/Odin

RUN cd /app/Odin && make

WORKDIR /app/Odin

ENTRYPOINT ["/app/Odin/odin"]
