CFLAGS=-std=c99 -Wall -O2 -fPIC -D_POSIX_SOURCE -D_GNU_SOURCE
LDLIBS=-ldl

runit-docker.so: runit-docker.c
	gcc -shared $(CFLAGS) $(LDLIBS) -o $@ $^

install: runit-docker.so
	mkdir -p $(DESTDIR)/sbin
	mkdir -p $(DESTDIR)/lib
	install -m 755 runit-docker $(DESTDIR)/sbin/
	install -m 755 runit-docker.so $(DESTDIR)/lib/

clean:
	$(RM) runit-docker.so
