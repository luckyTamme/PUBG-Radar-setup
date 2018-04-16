#!/bin/bash

echo ""
echo "PUBG PC IP (192.168.??.??)"
read game_ip

echo ""
echo "Router (gateway) IP (192.168.??.??)"
read router_ip

echo ""
echo "Radar PC IP (this machine) (192.168.??.??)"
read radar_ip

echo ""
echo "interface name"
ls /sys/class/net

read interface

cat >run.sh <<EOF
#!/bin/bash
sysctl -w net.ipv4.ip_forward=1
arpspoof -i $interface -t $game_ip $router_ip & >/dev/null
arpspoof -i $interface -t $router_ip $game_ip & >/dev/null
java -jar PUBG-Radar/target/Gaydar-6.9-jar-with-dependencies.jar $radar_ip PortFilter $game_ip

EOF

chmod +x run.sh
