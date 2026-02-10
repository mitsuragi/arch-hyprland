#!/bin/zsh
current_layout=$(hyprctl getoption input:kb_layout -j | jq -r .str)

if ("$current_layout" == "us"); then
  hyprctl keyword input:kb_layout ru
else
  hyprctl keyword input:kb_layout us
fi
