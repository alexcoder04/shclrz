SHELL = /bin/sh
NAME = shclrz

PREFIX ?= /usr


install:
	install -Dm755 shclrz "$(DESTDIR)$(PREFIX)/bin/shclrz"
	install -Dm644 README.md "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)/README.md"
	install -Dm644 LICENSE "$(DESTDIR)$(PREFIX)/share/licenses/$(NAME)/LICENSE"
	install -Dm644 shclrz.1 "$(DESTDIR)$(PREFIX)/share/man/man1/shclrz.1"

uninstall:
	$(RM) "$(DESTDIR)$(PREFIX)/bin/shclrz"
	$(RM) -r "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)"
	$(RM) -r "$(DESTDIR)$(PREFIX)/share/licenses/$(NAME)"
	$(RM) "$(DESTDIR)$(PREFIX)/share/man/man1/shclrz.1"

.PHONY: install

