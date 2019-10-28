# Kubernetes
    Kubernetes is a production-grade, open-source platform that orchestrates the placement (scheduling) and execution of application containers within and across computer clusters.

* [CLI](kubernetes/CLI)
* [Tutorial](kubernetes/tutorial)
* [kubeless](kubeless)
* [ingress](ingress)
* [kubeadm](kubeadm)
* [kops](kops)

https://h4rj2lec.mirror.aliyuncs.com
https://www.funtl.com/zh/service-mesh-kubernetes/

# Namespace
if namespace not exist, can not create resource under it
```
Error from server (NotFound): error when creating "nginx_namespace.yml": namespaces "demo" not found
```

if namespace has resources, deleting namcespace will delete all its resources

# Services
## ClusterIP
只是内部曝露, 适用于Front-back, back-dbs

## NodePort
不但止创建一个ClusterIP，也增加一个在Node节点上的30000+的门port供外部访问


## LoadBalancer
不需要设置防火墙，直接在云端创建一个loadbalancer

# Health check
- liveness Probe
  - 存在测试
- readiness Probe
  - 可用测试

3 type of check possible
1. http
2. Command
3. TCP

# kubernates-incubator/external-dns
自动创建dns subdomains


# Service Discovery
## DNS
need add addons
## Environment Variable

