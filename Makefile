systemduserunitdir = /usr/lib/systemd/user
libexecdir = /usr/lib
pkglibexecdir = ${libexecdir}/cdemu-autostart
docdir = /usr/share/doc/cdemu-autostart

.PHONY: all clean install uninstall

all:

clean:

install:
	install -d -m755 $(DESTDIR)$(docdir)/
	install -m644 README.txt $(DESTDIR)$(docdir)/
	install -d -m755 $(DESTDIR)$(pkglibexecdir)/
	install -m755 dbus-hook $(DESTDIR)$(pkglibexecdir)/
	install -d -m755 $(DESTDIR)$(systemduserunitdir)/
	install -m644 dbus-post.service dbus-pre.service $(DESTDIR)$(systemduserunitdir)/

uninstall:
	rm -f \
		$(DESTDIR)$(systemduserunitdir)/dbus-pre.service \
		$(DESTDIR)$(systemduserunitdir)/dbus-post.service \
		$(DESTDIR)$(docdir)/README.txt \
		$(DESTDIR)$(pkglibexecdir)/dbus-hook
	-rmdir $(DESTDIR)$(pkglibexecdir) $(DESTDIR)$(docdir)
