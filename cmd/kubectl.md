## 强制删除
先edit 关闭删除保护
kubectl delete po tiller-deploy-6fc9845795-t8xcp -n kube-system --grace-period=0 --force
