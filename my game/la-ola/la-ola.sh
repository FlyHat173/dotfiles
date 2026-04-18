#!/bin/sh
printf '\033c\033]0;%s\a' Mexican Wave Game
base_path="$(dirname "$(realpath "$0")")"
"$base_path/la-ola.x86_64" "$@"
