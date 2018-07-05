ssh-keygen -t rsa -P ''
ls -a ~/.ssh

echo "node1 password"
scp ~/.ssh/id_rsa.pub root@192.168.10.38:~/
ssh root@192.168.10.38 "cat id_rsa.pub >> ~/.ssh/authorized_keys"
echo "node2 password"
scp ~/.ssh/id_rsa.pub root@192.168.10.39:~/
ssh root@192.168.10.39 "cat id_rsa.pub >> ~/.ssh/authorized_keys"


