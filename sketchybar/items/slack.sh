#!/bin/bash

slack=(
  script="$PLUGIN_DIR/slack.sh"
  icon.font.size=20
  background.padding_left=15
  update_freq=5
)

sketchybar --add item slack right \
           --set slack "${slack[@]}" \
           --subscribe slack system_woke
