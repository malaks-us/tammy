#!/usr/bin/env sh
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
PROG="$(basename "$0")"
USER="${SUDO_USER:-${USER}}"
HOME="${USER_HOME:-${HOME}}"
CNAME="malaks-us.github.io/schuyler"
# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
printf '%s\n' "deploying website in $(basename "$PWD")"
cd $PWD || exit 1
rm -Rf ./dist ./docs
npm run build || exitCode=1

if [ -d "./dist" ] && [ "${exitCode:-0}" -eq 0 ]; then
  echo "$CNAME" >./dist/CNAME
  touch ./dist/.nojekyll
  mv -fv ./dist ./docs
  [ -d "./docs" ] && gitcommit deploy docs/ && exitCode=0 || exitCode=1
fi

if [ "$exitCode" -ne 0 ]; then
  printf '%s\n' "Failed to deploy website"
  exitCode=1
fi

exit ${exitCode:-$?}
