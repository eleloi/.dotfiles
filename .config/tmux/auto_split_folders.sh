#!/usr/bin/env bash

for directory in ./*/; do
  if [ -d "$directory" ]; then
    directory_name=$(basename "$directory")
    tmux new-window -c "$directory_name" -n "$directory_name" nvim
  fi
done
