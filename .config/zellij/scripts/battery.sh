used=$(upower -i $(upower -e | grep 'BAT')| awk -F'[:%]' '/percentage/ {gsub(/ /,"",$2); print $2}')
echo $used%
