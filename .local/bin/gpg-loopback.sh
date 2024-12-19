#!/bin/sh

if [ -n "$FUGITIVE" ]; then
  set -- --pinentry-mode loopback "$@"
fi
exec gpg "$@"
