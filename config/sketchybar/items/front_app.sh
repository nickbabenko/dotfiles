#!/bin/bash

front_app=(
  label.font="$FONT:Black:12.0"
  icon.background.drawing=on
  icon.padding_top=10
  icon.padding_bottom=10
  label.padding_left=10
  padding_left=15
  display=active
  script="$PLUGIN_DIR/front_app.sh"
  click_script="open -a 'Mission Control'"
)

sketchybar --add item front_app left         \
           --set front_app "${front_app[@]}" \
           --subscribe front_app front_app_switched

