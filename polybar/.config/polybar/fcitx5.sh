#!/bin/bash

case "$(fcitx5-remote -n)" in
  keyboard-us)
    echo "🇺🇸 EN"
    ;;
  vnkey)
    echo "🇻🇳 VI"
    ;;
esac
