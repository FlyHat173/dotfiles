#!/bin/bash

lang=$(fcitx5-remote -n)

if [[ "$lang" == "keyboard-us" ]]; then
    echo "%{F#89b4fa} EN%{F-}"
else
    echo "%{F#a6e3a1} VI%{F-}"
fi
