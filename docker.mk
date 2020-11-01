.PHONY: help setup dependencies build clean

NAME := tamakiii-sandbox/hello-clangd

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies

dependencies:
	@type docker > /dev/null

build: Dockerfile
	docker build -t $(NAME) .

bash: build
	docker run -it --rm -v $(PWD):/work -w /work $(NAME) $@

clean:
	docker image rm $(NAME)
