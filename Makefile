SHELL := bash

test: test-lua

test-lua:
	make -C $(@:test-%=%) test
