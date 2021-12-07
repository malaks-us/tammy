#!/usr/bin/env sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PROG="$(basename "$0")"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
cd $PWD || exit 1
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
remote="$(git config --get remote.origin.url 2>/dev/null)"
rm -Rf ./docs ./dist ./.git
gitadmin setup $remote
npm run deploy
