#!/bin/bash

##
## Documentation At:
## https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html
##

# enabled options {{{
set -o braceexpand
set -o notify
set -o hashall
set -o histexpand
set -o monitor
set -o physical

set -o emacs
# }}}

# useful for debugging {{{
# set -o verbose     -v
# set -o xtrace      -x
# }}}

# useful for scripting {{{

# set -o allexport   -a
# set -o errexit     -e
# set -o errtrace    -E
# set -o noglob      -f
# set -o keyword     -k
# set -o noexec      -n
# set -o nounset     -u
# set -o functrace   -T
# set -o pipefail

# set -              "End of Options"; '-' prefixed params taken literally
# set --             signal end of command options; used by builtins

# }}}

# No Immediate Use {{{

# set -o history         let shell set this
# set -o ignoreeof
# set -o noclobber   -C  disabled to avoid complacency on other systems
# set -o priveleged  -p
# set -o onecmd      -t
# set -o posix
# set -o vi

# }}}

