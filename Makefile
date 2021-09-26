SHELL = /bin/sh
NAME = shclrz

PREFIX ?= /usr/local


build:
	@echo "Nothing to do"

install:
	install -Dm644 README.md "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)/README.md"
	install -Dm755 shclrz "$(DESTDIR)$(PREFIX)/bin/shclrz"

clean:
	@echo "Nothing to do"

uninstall:
	rm -fr "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)"
	rm -f "$(DESTDIR)$(PREFIX)/bin/shclrz"

.PHONY: clean build install

