# runit-docker

On a scale from 1 to 10, how annoying is it that Docker uses `SIGTERM` but
`runsvdir` expects `SIGHUP`? I guess eleven. Goddammit!

No, really. You'd expect that when Docker sends SIGTERM to init (`runsvdir`
in our case) it would behave like a proper process supervisor and kill the
`runsv`s it manages. Except it doesn't, causing a slow, unclean container
shutdown. I don't care whose fault this is. Docker and Runit are awesome
and they should talk to each other.

This little wrapper fixes the interfacing SNAFU. It differs from
the other nanny processes found on the web in that it isn't a process but
a preloaded library - so your process list OCD isn't offended: there's only
`runsvdir` but everything Just Works™.

## Usage

Build with `make`, install with `make install`. Start with `docker run {blah} /sbin/runit-docker`.
Debian support is included; build with `debian/rules binary` for easy package reuse.

## Author

runit-docker was written by Kosma Moczek &lt;kosma@kosma.pl&gt; during a single Scrum
planning meeting. Damn meetings.
