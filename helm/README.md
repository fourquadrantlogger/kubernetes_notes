## download
Download https://github.com/kubernetes/helm/releases?after=v2.7.0

using aliyun mirror

https://cs.console.aliyun.com/?spm=5176.2020520001.aliyun_topbar.11.69864bd3Xf9stp#/k8s/repo/list

## install 
```
helm init --force-upgrade -i registry.cn-hangzhou.aliyuncs.com/google-containers/tiller:v2.8.2  --stable-repo-url https://aliacs-app-catalog.oss-cn-hangzhou.aliyuncs.com/charts/
```

top version is 2.7.0

+ problem
```
helm list 
Error: configmaps is forbidden: User "system:serviceaccount:kube-system:default" cannot list configmaps in the namespace "kube-system"

```

+ fix
```
kubectl create clusterrolebinding add-on-cluster-admin --clusterrole=cluster-admin --serviceaccount=kube-system:default
```
