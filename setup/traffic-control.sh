sudo tc qdisc add dev docker1 root handle 1: htb default 12
sudo tc class add dev docker1 parent 1:1 classid 1:12 htb rate 1.6mbit ceil 1.6mbit
sudo tc qdisc add dev docker1 parent 1:12 netem delay 150ms