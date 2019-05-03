prefix ?= /usr/local
bindir = $(prefix)/bin
libdir = $(prefix)/lib

build:
	swift build -c release --disable-sandbox

install: build
	mkdir -p "$(bindir)"
	install ".build/release/latlon" "$(bindir)/latlon"

uninstall:
	rm -rf "$(bindir)/latlon"

clean:
	rm -rf .build

.PHONY: build install uninstall clean
