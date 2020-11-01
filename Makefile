.PHONY: help setup dependencies clean

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies \
	deps/llvm/llvm-project

dependencies:
	@type git > /dev/null

deps/llvm/llvm-project: deps/llvm
	git clone --depth 1 git@github.com:llvm/llvm-project.git $@

deps/llvm: deps
	mkdir -p $@

deps:
	mkdir -p $@

clean:
	rm -rf deps
