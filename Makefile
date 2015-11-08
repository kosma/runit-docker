CFLAGS+=-std=c99 -Wall -O2 -fPIC -D_POSIX_SOURCE -D_GNU_SOURCE
LDFLAGS+=-ldl

PROGNAME=runit-docker

all: $(PROGNAME).so

%.so: %.c
	gcc -shared $(CFLAGS) $(LDFLAGS) -o $@ $^

install: runit-docker.so
	mkdir -p $(DESTDIR)/usr/sbin
	mkdir -p $(DESTDIR)/usr/lib/runit-docker/
	install -m 755 $(PROGNAME) $(DESTDIR)/sbin/
	install -m 755 $(PROGNAME).so $(DESTDIR)/usr/lib/runit-docker/

clean:
	$(RM) $(PROGNAME).so
