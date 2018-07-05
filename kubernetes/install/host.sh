hostnamectl set-hostname master
echo "192.168.10.37 master" >>/etc/hosts
echo "192.168.10.38 node1" >> /etc/hosts
echo "192.168.10.39 node2" >>/etc/hosts
ssh node1 "hostnamectl set-hostname node1"
ssh node1 "echo '192.168.10.37	master' >>/etc/hosts"
ssh node1 "echo '192.168.10.38	node1' >>/etc/hosts"
ssh node1 "echo '192.168.10.39	node2' >>/etc/hosts"

ssh node2 "hostnamectl set-hostname node2"
ssh node2 "echo '192.168.10.37  master' >>/etc/hosts"
ssh node2 "echo '192.168.10.38  node1' >>/etc/hosts"
ssh node2 "echo '192.168.10.39  node2' >>/etc/hosts"
