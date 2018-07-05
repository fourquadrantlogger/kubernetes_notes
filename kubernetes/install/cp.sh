bin=`pwd`

cp cfssl /usr/local/bin
cp cfssljson /usr/local/bin

tar -zxvf etcd-v3.2.9-linux-amd64.tar.gz
mv etcd-v3.2.9-linux-amd64/etcd /usr/local/bin
mv etcd-v3.2.9-linux-amd64/etcdctl /usr/local/bin

mkdir -p /etc/etcd && cp -r etc/etcd/ssl /etc/etcd/
groupadd etcd && useradd -c "Etcd user" -g etcd -s /sbin/nologin -r etcd

mkdir -p /var/lib/etcd && chown etcd:etcd -R /var/lib/etcd /etc/etcd
mkdir -p /etc/etcd && cp etc/etcd/etcd.conf /etc/etcd/etcd.conf
cp master/lib/systemd/system/*.service /lib/systemd/system/
cp -r etc/kubernetes /etc/
cp  master/etc/* /etc/kubernetes/
cp k8s/* /usr/local/bin
chmod +x /usr/local/bin/*

mkdir -p /var/lib/kubelet /var/log/kubernetes
