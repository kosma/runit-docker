# runit-docker

Docker and `runsvdir` don't quite agree on what each signal means, causing
TONS of frustration when attempting to use `runsvdir` as init under Docker.
`runit-docker` is a plug'n'play adapter library which does signal translation
without the overhead and nuisance of running a nanny process.

Project status: mature and complete. There are no new commits because there
is no need for them; the project does what what it says on the tin.

## Features

* Pressing Ctrl-C does a clean shutdown.
* `docker stop` does a clean shutdown.

Under the hood, `runit-docker` translates `SIGTERM` and `SIGINT` to `SIGHUP`
using `LD_PRELOAD`.

## Usage

* Build with `make`, install with `make install`.
* Add `CMD ["/usr/sbin/runit-docker"]` to your `Dockerfile`.
* Run `debian/rules clean build binary` to build a Debian package.

## Author

runit-docker was written by Kosma Moczek &lt;kosma@kosma.pl&gt; during a single Scrum
planning meeting. Damn meetings.
