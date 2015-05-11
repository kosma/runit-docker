CFLAGS=-std=c99 -Wall -O2 -fPIC -D_POSIX_SOURCE -D_GNU_SOURCE
LDLIBS=-ldl

runit-docker.so: runit-docker.c
	gcc -shared $(CFLAGS) $(LDLIBS) -o $@ $^

install: runit-docker.so
	install -m 755 init-runit-docker /sbin/
	install -m 755 runit-docker.so /lib/

clean:
	$(RM) runit-docker.so
