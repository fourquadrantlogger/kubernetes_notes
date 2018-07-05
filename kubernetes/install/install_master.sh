systemctl stop firewalld && systemctl disable firewalld
setenforce 0

bin=`pwd`

cat <<EOF > /etc/sysctl.d/k8s.conf
net.ipv4.ip_forward = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
EOF

modprobe br_netfilter
sysctl -p /etc/sysctl.d/k8s.conf




groupadd etcd && useradd -c "Etcd user" -g etcd -s /sbin/nologin -r etcd



systemctl enable etcd.service && systemctl start etcd.service

export CA="/etc/etcd/ssl"
ETCDCTL_API=3 etcdctl \
    --cacert=${CA}/etcd-ca.pem \
    --cert=${CA}/etcd.pem \
    --key=${CA}/etcd-key.pem \
    --endpoints="https://127.0.0.1:2379" \
    endpoint health

cd $bin
 

export BOOTSTRAP_TOKEN=$(head -c 16 /dev/urandom | od -An -t x | tr -d ' ')
cat <<EOF > /etc/kubernetes/token.csv
${BOOTSTRAP_TOKEN},kubelet-bootstrap,10001,"system:kubelet-bootstrap"
EOF
 
cd /etc/kubernetes/pki


KUBE_APISERVER=https://master:8080/
# bootstrap set-cluster
kubectl config set-cluster kubernetes \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=../bootstrap.conf

# bootstrap set-credentials
kubectl config set-credentials kubelet-bootstrap \
    --token=${BOOTSTRAP_TOKEN} \
    --kubeconfig=../bootstrap.conf

# bootstrap set-context
kubectl config set-context default \
    --cluster=kubernetes \
    --user=kubelet-bootstrap \
   --kubeconfig=../bootstrap.conf

# bootstrap set default context
kubectl config use-context default --kubeconfig=../bootstrap.conf

kubectl config set-cluster kubernetes \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=../admin.conf

# admin set-credentials
kubectl config set-credentials kubernetes-admin \
    --client-certificate=admin.pem \
    --client-key=admin-key.pem \
    --embed-certs=true \
    --kubeconfig=../admin.conf

# admin set-context
kubectl config set-context kubernetes-admin@kubernetes \
    --cluster=kubernetes \
    --user=kubernetes-admin \
    --kubeconfig=../admin.conf

# admin set default context
kubectl config use-context kubernetes-admin@kubernetes \
    --kubeconfig=../admin.conf

# controller-manager set-cluster
kubectl config set-cluster kubernetes \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=../controller-manager.conf

# controller-manager set-credentials
kubectl config set-credentials system:kube-controller-manager \
    --client-certificate=controller-manager.pem \
    --client-key=controller-manager-key.pem \
    --embed-certs=true \
    --kubeconfig=../controller-manager.conf

# controller-manager set-context
kubectl config set-context system:kube-controller-manager@kubernetes \
    --cluster=kubernetes \
    --user=system:kube-controller-manager \
    --kubeconfig=../controller-manager.conf

# controller-manager set default context
kubectl config use-context system:kube-controller-manager@kubernetes \
    --kubeconfig=../controller-manager.conf

# scheduler set-cluster
kubectl config set-cluster kubernetes \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=../scheduler.conf

# scheduler set-credentials
kubectl config set-credentials system:kube-scheduler \
    --client-certificate=scheduler.pem \
    --client-key=scheduler-key.pem \
    --embed-certs=true \
    --kubeconfig=../scheduler.conf

# scheduler set-context
kubectl config set-context system:kube-scheduler@kubernetes \
    --cluster=kubernetes \
    --user=system:kube-scheduler \
    --kubeconfig=../scheduler.conf

# scheduler set default context
kubectl config use-context system:kube-scheduler@kubernetes \
    --kubeconfig=../scheduler.conf

# kubelet set-cluster
kubectl config set-cluster kubernetes \
    --certificate-authority=ca.pem \
    --embed-certs=true \
    --server=${KUBE_APISERVER} \
    --kubeconfig=../kubelet.conf

# kubelet set-credentials
kubectl config set-credentials system:node:master \
    --client-certificate=kubelet.pem \
    --client-key=kubelet-key.pem \
    --embed-certs=true \
    --kubeconfig=../kubelet.conf

# kubelet set-context
kubectl config set-context system:node:master@kubernetes \
    --cluster=kubernetes \
    --user=system:node:master \
    --kubeconfig=../kubelet.conf

# kubelet set default context
kubectl config use-context system:node:master@kubernetes \
    --kubeconfig=../kubelet.conf



key=`head -c 32 /dev/urandom | base64`
cat <<EOF > /etc/kubernetes/encryption.yml
kind: EncryptionConfig
apiVersion: v1
resources:
  - resources:
      - secrets
    providers:
      - aescbc:
          keys:
            - name: key1
              secret: 
EOF

echo ${key}>> t.txt
cat <<EOF > /etc/kubernetes/encryption.yml

      - identity: {}
EOF

cat <<EOF > /etc/kubernetes/audit-policy.yml
apiVersion: audit.k8s.io/v1beta1
kind: Policy
rules:
- level: Metadata
EOF

cd $bin



systemctl daemon-reload 
systemctl enable kube-apiserver.service
systemctl start kube-apiserver.service
systemctl enable kube-controller-manager.service
systemctl start kube-controller-manager.service
systemctl enable kube-scheduler.service
systemctl start kube-scheduler.service

# 复制 admin kubeconfig 文件，并通过简单指令验证
cp /etc/kubernetes/admin.conf ~/.kube/config
kubectl get cs
kubectl get node
kubectl -n kube-system get po

kubectl -n kube-system logs -f kube-scheduler-master

# 传送文件到 node 


for NODE in node1 node2; do
    ssh ${NODE} "mkdir -p /etc/kubernetes/pki/"
    ssh ${NODE} "mkdir -p /etc/etcd/ssl"
    ssh ${NODE} "mkdir -p /etc/systemd/system/kubelet.service.d"
    # Etcd ca and cert
    for FILE in etcd-ca.pem etcd.pem etcd-key.pem; do
      scp /etc/etcd/ssl/${FILE} ${NODE}:/etc/etcd/ssl/${FILE}
    done
    # Kubernetes ca and cert
    for FILE in pki/ca.pem pki/ca-key.pem bootstrap.conf; do
      scp /etc/kubernetes/${FILE} ${NODE}:/etc/kubernetes/${FILE}
    done
    # Kubelet  
    scp  k8s/kubectl k8s/kubelet  ${NODE}:/usr/local/bin
    ssh ${NODE} "chmod +x /usr/local/bin/*"

    scp  node/lib/systemd/system/kubelet.service ${NODE}:/lib/systemd/system/kubelet.service

	
    ssh ${NODE} " mkdir -p /var/lib/kubelet /var/log/kubernetes /etc/kubernetes/manifests"
    ssh ${NODE} "systemctl enable kubelet.service && systemctl start kubelet.service"

done
	
cd $bin
kubectl create clusterrolebinding kubelet-bootstrap  --clusterrole=system:node-bootstrapper  --user=kubelet-bootstrap
kubectl get csr

kubectl get csr | awk '/Pending/ {print $1}' | xargs kubectl certificate approve
kubectl get no

