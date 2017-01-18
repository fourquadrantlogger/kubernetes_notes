#! /bin/bash
echo "pwd="
pwd
echo "start sshd"
/etc/init.d/ssh start
echo "start dfs"
start-dfs.sh
echo "start yarn"
start-yarn.sh
/bin/bash
