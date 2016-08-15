#!/bin/bash -e

# disable stty features {{{
  # http://vaab.blog.kal.fr/2010/11/11/enabling-ctrl-s-for-forward-history-search-in-bash/

  # prevent crtl-s from being caught
  stty stop  ''
  # prevent crtl-Q from being caught
  stty start ''
  stty discard undef
# }}}

