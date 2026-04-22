used=$(free -h | awk '/^Mem:/ {print $3}')
echo $used
