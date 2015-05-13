# runit-docker

Docker and `runsvdir` don't quite agree on what each signal means, causing
TONS of frustration when attempting to use `runsvdir` as init under Docker.
`runit-docker` is a plug'n'play adapter library which does signal translation
without the overhead and nuisance of running a nanny process.

## Features

* Pressing Ctrl-C does a clean shutdown.
* `docker stop` does a clean shutdown.

Under the hood, `runit-docker` translates `SIGTERM` and `SIGINT` to `SIGHUP`.

## Usage

Build with `make`, install with `make install`. Start with `docker run {blah} /sbin/runit-docker`.
Debian support is included; build with `debian/rules binary` for easy package reuse.

```
CMD ["/sbin/runit-docker"]
```

Run `debian/rules clean build binary` to build a Debian package.

## Author

runit-docker was written by Kosma Moczek &lt;kosma@kosma.pl&gt; during a single Scrum
planning meeting. Damn meetings.
