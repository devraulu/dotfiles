# Use i3-msg instead of swaymsg
i3-msg subscribe -m '[ "workspace" ]' | while read -r line; do
   workspace=$(echo "$line" | jq -r '.change.current.name')
   i3-msg '[title="^Picture in picture$"] move to workspace '$workspace
done
