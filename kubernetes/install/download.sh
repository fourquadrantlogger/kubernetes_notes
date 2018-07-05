etcdversion="3.2.9"
notdownload="true"
rm -r etc lib

bin=`pwd`
echo "___________ install cfssl cfssljson ______________ "
#tls
export CFSSL_URL="https://pkg.cfssl.org/R1.2"
if [ ${notdownload} != "false" ];then	
	#wget "${CFSSL_URL}/cfssl_linux-amd64"  -O cfssl
	#wget "${CFSSL_URL}/cfssljson_linux-amd64" -O cfssljson
	echo "n"
fi


#ca

mkdir -p etc/etcd/ssl
cd etc/etcd/ssl
export PKI_URL="https://kairen.github.io/files/manual-v1.8/pki"
wget "${PKI_URL}/ca-config.json" "${PKI_URL}/etcd-ca-csr.json"
wget "${PKI_URL}/etcd-csr.json"
# etcd
cd $bin
echo "___________ download etcd ______________ "
mkdir -p lib/systemd/system
export ETCD_URL="https://github.com/coreos/etcd/releases/download"
if [ ${notdownload} != "false" ];then	
	#wget "${ETCD_URL}/v${etcdversion}/etcd-v${etcdversion}-linux-amd64.tar.gz" 
	echo "n"
fi
export ETCD_CONF_URL="https://kairen.github.io/files/manual-v1.8/master"
wget "${ETCD_CONF_URL}/etcd.conf" -O  etc/etcd/etcd.conf
wget "${ETCD_CONF_URL}/etcd.service" -O  lib/systemd/system/etcd.service
# ca & k8s
echo "___________ download ca ______________ "
cd $bin
mkdir -p etc/kubernetes/pki && cd etc/kubernetes/pki
export PKI_URL="https://kairen.github.io/files/manual-v1.8/pki"
cd etc/kubernetes/pki
wget "${PKI_URL}/ca-config.json" "${PKI_URL}/ca-csr.json"
wget "${PKI_URL}/apiserver-csr.json"
wget "${PKI_URL}/front-proxy-ca-csr.json"
wget "${PKI_URL}/front-proxy-client-csr.json"
wget "${PKI_URL}/admin-csr.json"
wget "${PKI_URL}/manager-csr.json"
wget "${PKI_URL}/scheduler-csr.json"
wget "${PKI_URL}/kubelet-csr.json"
# k8s
cd $bin
echo "___________ download k8s cfg ______________ "
export CORE_URL="https://kairen.github.io/files/manual-v1.8/master"
mkdir -p etc/kubernetes/manifests && cd etc/kubernetes/manifests
  for FILE in apiserver manager scheduler; do
    wget "${CORE_URL}/${FILE}.yml.conf" -O ${FILE}.yml
  done
cd $bin
mkdir node && cd node
mkdir -p lib/systemd/system
cd $bin
cd etc/kubernetes/pki
wget "${PKI_URL}/kube-proxy-csr.json"
export ADDON_URL="https://kairen.github.io/files/manual-v1.8/addon"
mkdir -p etc/kubernetes/addons && cd etc/kubernetes/addons
wget "${ADDON_URL}/kube-proxy.yml.conf" -O kube-proxy.yml
echo "___________ download k8s dashboard ______________ "
cd $bin
export ADDON_URL="https://kairen.github.io/files/manual-v1.8/addon"
wget ${ADDON_URL}/kube-dashboard.yml.conf -O kube-dashboard.yml
cd $bin
