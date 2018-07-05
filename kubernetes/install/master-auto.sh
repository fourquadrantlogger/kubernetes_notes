bin=`pwd`
sh makersa.sh
sh host.sh
sh cert.sh
cd $bin
sh cp.sh
cd $bin
sh install_master.sh

