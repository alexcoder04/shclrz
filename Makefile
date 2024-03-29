
NAME = shclrz

SHELL = /bin/sh
RM = rm

PREFIX ?= /usr

install:
	install -Dm755 $(NAME) "$(DESTDIR)$(PREFIX)/bin/$(NAME)"
	install -Dm644 README.md "$(DESTDIR)$(PREFIX)/share/doc/$(NAME)/README.md"
	install -Dm644 LICENSE "$(DESTDIR)$(PREFIX)/share/licenses/$(NAME)/LICENSE"
	install -Dm644 $(NAME).1 "$(DESTDIR)$(PREFIX)/share/man/man1/$(NAME).1"

.PHONY: install
