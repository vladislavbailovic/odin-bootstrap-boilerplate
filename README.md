# odin-bootstrap-boilerplate


## Table of Contents

- [Quick Start](#markdown-header-quick-start)
	- [Running](#markdown-header-running)


## Quick Start


### Running

Simple run, with all defaults:

```console
$ make run
```

This will recognize local Odin install (if any) and prefer that. Otherwise, it'll build a Docker image (if not already present) and use that.

To force the use of docker image:

```console
$ make run -e FORCE_PULL=1
```

This will build the Docker image (if not there already) and use that, regardless of the local Odin install presence.

To force the docker image rebuild:

```console
$ make run -e FORCE_PULL=1 -e NO_CACHE=1
```

This will always build the Docker image from scratch and use that.
