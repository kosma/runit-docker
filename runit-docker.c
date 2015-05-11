#include <signal.h>
#include <dlfcn.h>
#include <stdlib.h>

static void (*real_s_term)(int) = NULL;
static void (*real_s_hangup)(int) = NULL;

static void fake_s_term(int signum)
{
  real_s_hangup(signum);
}

static int (*real_sigaction)(int signum, const struct sigaction *act, struct sigaction *oldact) = NULL;

int sigaction(int signum, const struct sigaction *act, struct sigaction *oldact)
{
  // Retrieve the real sigaction we just shadowed.
  if (real_sigaction == NULL) {
    real_sigaction = (void *) dlsym(RTLD_NEXT, "sigaction");
    // Prevent further shadowing in children.
    unsetenv("LD_PRELOAD");
  }

  if (real_s_term == NULL) {
    // Override installed s_term() with our own.
    real_s_term = act->sa_handler;
    ((struct sigaction *) act)->sa_handler = fake_s_term;
  } else if (real_s_hangup == NULL) {
    // Save real s_hangup() for SIGTERM handling.
    real_s_hangup = act->sa_handler;
  }

  // Forward the call the the real sigaction.
  return real_sigaction(signum, act, oldact);
}

// vim: ts=2 sw=2 et
