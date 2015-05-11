# runit-docker

On a scale from 1 to 10, how annoying is it that Docker uses `SIGTERM` but
`runsvdir` expects `SIGHUP`? I guess eleven. Goddammit!

This little wrapper fixes the interfacing SNAFU. It differs from
the other nanny processes found on the web in that it isn't a process but
a preloaded library - so your process list OCD isn't offended: there's just
`runsvdir` but everything Just Works™.

## Usage

Build with `make`, install with `make install`. Start with `docker run {blah} /sbin/runit-docker`.

## Author

runit-docker was written by Kosma Moczek &lt;kosma@kosma.pl&gt; at PIXERS.
