
SPACE_ICONS=("1" "2" "3" "4" "5" "6" "7" "8" "9" "10")
for i in "${!SPACE_ICONS[@]}"
do
  sid="$(($i+1))"
  space=(
    space="$sid"
    icon.font="$FONT:Bold:20.0"
    icon="•"
    icon.padding_left=4
    icon.padding_right=8
    background.color=$BG2
    background.corner_radius=200
    icon.highlight_color=$GREEN
    background.height=10
    label.padding_right=20
    label.drawing=off
    label.width="dynamic"
    script="$CONFIG_DIR/space.sh"
    click_script="yabai -m space --focus $sid"
    background.drawing=off
  )
  sketchybar --add space space."$sid" center --set space."$sid" "${space[@]}"
done

spaces=(
  background.color=$BG2
  background.border_color=$BACKGROUND_2
  background.border_width=2
  background.drawing=on
  background.height=15
)

sketchybar --add bracket spaces '/space\..*/' \
           --set spaces "${spaces[@]}"       \
