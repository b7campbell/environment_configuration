# Bash

The bash configuration stars with bash's builtin options such as set and shopt. Then, at the top level, there are a number of interactively available aliases and functions.

bash  
 | &nbsp;&nbsp; |━ aliases-darwin.sh  
 | &nbsp;&nbsp; |━ aliases-linux.sh  
 | &nbsp;&nbsp; |━ aliases.sh  
 | &nbsp;&nbsp; |━ config-for-darwin.sh  
 | &nbsp;&nbsp; |━ config-for-linux.sh  
 | &nbsp;&nbsp; |━ functions-darwin.sh  
 | &nbsp;&nbsp; |━ functions-linux.sh  
 | &nbsp;&nbsp; |━ functions.sh  
 | &nbsp;&nbsp; |━ set.sh  
 | &nbsp;&nbsp; |━ shopt.sh  

As can be seen in the naming convention above, there are some functions and alialiases that are operating system agnostic. Others are kept in files that will be included only a darwin- or linux- type operation system.


## Unused set Options

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

## shopt

# cd assumes non-directory arugments are variables
shopt -u cdable_vars

# cd corrections minor syntactic errors
shopt -s cdspell

# bash looks into hashtable before plumbing PATH for a command
shopt -u checkhash

# automatically update LINES and COLS when window is resized
shopt -s checkwinsize

# save all lines of a multi-line command
shopt -s cmdhist

# bash wildcards glob hidden files
shopt -s dotglob

# a non-interactive shell does not exit during a failed exec
shopt -u execfail

# expand aliases
shopt -s expand_aliases

# glob with extended pattern matching features  ?(), @(), !(), etc.
shopt -s extglob

# append to history file rather than truncating it
shopt -s histappend

# failed history expansion prints failed command on prompt
shopt -s histreedit

# successful history expansion does not fully execute command
shopt -s histverify

# tab completion lists hosts following a @ character
shopt -u hostcomplete

# send a SIGUP singal upon exit
shopt -u huponexit

# comments are allowed in command prompt
shopt -s interactive_comments

# multiline commands are not saved with embedded newline chars
shopt -u lithist

# do not tab complete on empty command prompt
shopt -s no_empty_cmd_completion

# globbing is case sensitive
shopt -u nocaseglob

# globbing with no matches is then treated as a literal string
shopt -u nullglob

# enable completion
shopt -s progcomp

# prompt strings undergo variable and parameter expansion
shopt -s promptvars

# NOTE: unchangeable setting; let the shell handle it
# shopt -u restricted_shell

# the shift builtin does not warn when beyond index of positional parameter
shopt -u shift_verbose

# source builtin will not look for files in $PATH after current dir
shopt -u sourcepath

# expand blackslash-escape sequences
shopt -s xpg_echo

