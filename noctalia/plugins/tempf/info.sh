t=$(cat /sys/devices/platform/coretemp.0/hwmon/*/temp1_input)
c=$((t / 1000))
f=$((c * 9 / 5 + 32))
echo "CPU temp: ${c}C / ${f}F"
echo "Load: $(cut -d" " -f1-3 /proc/loadavg)"
m=$(free -h | grep Mem | tr -s " ")
echo "RAM: $(echo $m | cut -d" " -f3) / $(echo $m | cut -d" " -f2)"
