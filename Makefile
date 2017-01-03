build:
	mkdir -p lib
	rm -rf lib/*
	node_modules/.bin/coffee --compile --map --output lib/ src/

watch:
	node_modules/.bin/coffee --watch --compile --map --output lib/ src/

test:
	node_modules/.bin/promises-aplus-tests lib/adapter.js

.PHONY: test build
