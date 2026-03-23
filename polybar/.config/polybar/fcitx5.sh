#!/bin/bash

case "$(fcitx5-remote -n)" in
  keyboard-us)
    echo "🇺🇸 EN"
    ;;
  unikey)
    echo "🇻🇳 VI"
    ;;
esac
