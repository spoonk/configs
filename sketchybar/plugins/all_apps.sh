
if [ "$SENDER" = "space_change" ]; then
  sketchybar --set "$NAME" label="$( \
      jq -r '.display-1' | \
      yabai -m query --windows --space  | \
      jq -r '.[].app' | \
      tr '\n' ' ')" \
      background.image="/Applications/Arc.app/Contents/Resources/AppIcon.icns"
fi
