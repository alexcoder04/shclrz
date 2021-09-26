SHELL = /bin/sh
NAME = shclrz

PREFIX ?= /usr


install:
	install -Dm755 shclrz "$(DESTDIR)$(PREFIX)/bin/shclrz"
	install -Dm644 README.md "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)/README.md"
	install -Dm644 shclrz.1 "$(DESTDIR)$(PREFIX)/share/man/man1/shclrz.1"

uninstall:
	rm -fr "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)"
	rm -f "$(DESTDIR)$(PREFIX)/bin/shclrz"
	rm -f "$(DESTDIR)$(PREFIX)/share/man/man1/shclrz.1"

.PHONY: install

