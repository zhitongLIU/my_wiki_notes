# Kubernetes
    Kubernetes is a production-grade, open-source platform that orchestrates the placement (scheduling) and execution of application containers within and across computer clusters.

Launch test Enviroment locally
```
    minikube start
```

in `~/.kube/config` we have our enviroment configurations

To use a specify conf
```
kubectl config use-context [ minikube ]
```

## Concepts & Info desplay
### Cluster
    1 master + minmun 3 nodes
```
kubectl cluster-info
```

### Deployment
    A Deployment is responsible for creating and updating instances of your application
```
kubectl get deployments
```

* scal deployment
```
kubectl scale deployments/kubernetes-bootcamp --replicas#4
```

### Services
    abstration of pods to expose to outside

    A Kubernetes Service is an abstraction layer which defines a logical set of Pods and enables external traffic exposure, load balancing and service discovery for those Pods.
```
kubectl get services
kubectl describe services/SERVICE_NAME
```
* start service
```
kubectl expose deployment/kubernetes-bootcamp --type#"NodePort" --port 8080
kubectl expose deployment/kubernetes-bootcamp --type#"LoadBalancer"
```

* delete service
```
kubectl delete service -l run#kubernetes-bootcamp
```
after the service is deleted, apps are nolonger expose to outside, but still running in pods

### Nodes
    machines or vms contains [multiple] pods

    A node is a VM or a physical computer that serves as a worker machine in a Kubernetes cluster. Each node has a Kubele agent
```
kubectl get nodes
```

### Pods
    A Pod is a group of one or more application containers (such as Docker or rkt) and includes shared storage (volumes), IP address and information about how to run them.
```
kubectl get pods
kubectl describe pods
kubectl get pods -l app#v1
kubectl get pods -o wide
```
* get pod name
```
export POD_NAME#$(kubectl get pods -o go-template --template '{{range .items}}{{.metadata.name}}{{"\n"}}{{end}}')
echo Name of the Pod: $POD_NAME
```

* label pod
```
kubectl label pod $POD_NAME app#v1
```

* Get pods enviroment vars
```
kubectl exec $POD_NAME env
```

* ssh into pod
```
kubectl exec -ti $POD_NAME bash
```

## Deploy
```
kubectl run kubernetes-bootcamp --image#docker.io/jocatalin/kubernetes-bootcamp:v1 --port#8080
```

start a proxy from pod to local
```
kubectl proxy
```


## logs
get logs of a pod
```
kubectl logs POD_NAME [CONTAINER_NAME]
```



## Rolling Update
    Rolling updates allow Deployments' update to take place with zero downtime by incrementally updating Pods instances with new ones.

set update
```
kubectl set image deployments/kubernetes-bootcamp kubernetes-bootcamp#jocatalin/kubernetes-bootcamp:v2
kubectl set image deployments/DEPLOYMENT_NAME CONTAINER_NAME#container_image:version
```


confirm update
```
kubectl rollout status deployments/kubernetes-bootcamp
```


rollback
```
kubectl rollout undo deployments/kubernetes-bootcamp
```

## clean up
remove service
```
kubectl delete service [SERVICE_NAME]
```

remove deployment
```
kubectl delete deployment [DEPLOYMENT_NAME]
```
