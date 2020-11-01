.PHONY: help setup dependencies build clean remove

help:
	@cat $(firstword $(MAKEFILE_LIST))

setup: \
	dependencies \
	deps/llvm/llvm-project

dependencies:
	@type git > /dev/null

build: \
	build/llvm

build/llvm: deps/llvm/llvm-project/llvm
	mkdir -p $@ && cd $@ && cmake $<

deps/llvm/llvm-project: deps/llvm
	git clone --depth 1 git@github.com:llvm/llvm-project.git $@

deps/llvm: deps
	mkdir -p $@

deps:
	mkdir -p $@

clean:
	rm -rf build
	rm -rf CMakeFiles
	rm -rf CMakeCache.txt

remove:
	rm -rf deps
