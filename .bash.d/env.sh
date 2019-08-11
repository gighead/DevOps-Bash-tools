#!/usr/bin/env bash
#  shellcheck disable=SC2139
#  vim:ts=4:sts=4:sw=4:et
#
#  Author: Hari Sekhon
#  Date: circa 2006 (forked from .bashrc)
#
#  https://github.com/harisekhon/bash-tools
#
#  License: see accompanying Hari Sekhon LICENSE file
#
#  If you're using my code you're welcome to connect with me on LinkedIn and optionally send me feedback to help steer this or other code I publish
#
#  https://www.linkedin.com/in/harisekhon
#

# ============================================================================ #
#                   E n v i r o n m e n t   V a r i a b l e s
# ============================================================================ #

export TERM=xterm

export EDITOR=vim

# allow programs to use $LINES
export LINES

# ENV refers to the file that sh attempts to read as a startup file (done on my Mac OSX Snow Leopard)
# Needs the following line added to sudoers for ENV to be passed through on sudo su
#Defaults	env_keep += "ENV"
export ENV="$HOME/.bashrc"

# ============================================================================ #

if [ -n "$APPLE" ]; then
    #BROWSER=open
    unset BROWSER
elif which google-chrome &>/dev/null; then
    BROWSER=google-chrome
elif which firefox &>/dev/null; then
    BROWSER=firefox
elif which konqueror &>/dev/null; then
    BROWSER=konqueror
else
    BROWSER=UNKNOWN
    echo "COULD NOT FIND ANY BROWSER IN PATH"
fi

# don't export BROWSER on Mac, trigger python bug:
# AttributeError: 'MacOSXOSAScript' object has no attribute 'basename'
# from python's webbrowser library
if [ -z "$APPLE" ]; then
    export BROWSER
fi
