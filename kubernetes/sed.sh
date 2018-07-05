sed -i "s/172.16.35.12/192.168.10.37/g" `grep 172.16.35.12 -rl install`
sed -i "s/master1/master/g" `grep master1 -rl install`


