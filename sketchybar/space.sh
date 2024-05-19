
#!/bin/bash


update() {
  WIDTH="dynamic"
  # DRAW_BACKGROUND=0xffffffff
  BG_COLOR=0x00000000
  if [ "$SELECTED" = "true" ]; then
    WIDTH="0"
    BG_COLOR=0xffa6da95
    # DRAW_BACKGROUND="on"
  fi

  sketchybar --animate exp 10 --set $NAME \
    icon.highlight=$SELECTED label.width=$WIDTH \
    background.color=$BG_COLOR
    # background.drawing=$DRAW_BACKGROUND
}

case "$SENDER" in
  "mouse.clicked") mouse_clicked
  ;;
  *) update
  ;;
esac
