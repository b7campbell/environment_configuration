#!/bin/bash -e

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

# display "The mail in mailfile has been read" as appropriate
shopt -u mailwarn

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

