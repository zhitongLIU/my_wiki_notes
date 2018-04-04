# Ingress
An Ingress is a collection of rules that allow inbound connections to reach the cluster services.

An Ingress controller is responsible for fulfilling the Ingress, usually with a loadbalancer, though it may also configure your edge router or additional frontends to help handle the traffic in an HA manner.

```
    internet
        |
   [ Ingress ]
   --|-----|--
   [ Services ]
```

# Using Ingress in kubernetes
ref: https://www.katacoda.com/courses/kubernetes/create-kubernetes-ingress-routes

Ingress is deployed as a Replication Controller. This controller combines a software load balancer, such as Nginx or HAProxy, with Kubernetes integration for configuring itself based on the defined rules.

deployment.yaml
```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: webapp1
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: webapp1
    spec:
      containers:
      - name: webapp1
        image: katacoda/docker-http-server:latest
        ports:
        - containerPort: 80
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: webapp2
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: webapp2
    spec:
      containers:
      - name: webapp2
        image: katacoda/docker-http-server:latest
        ports:
        - containerPort: 80
---
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: webapp3
spec:
  replicas: 1
  template:
    metadata:
      labels:
        app: webapp3
    spec:
      containers:
      - name: webapp3
        image: katacoda/docker-http-server:latest
        ports:
        - containerPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: webapp1-svc
  labels:
    app: webapp1
spec:
  ports:
  - port: 80
  selector:
    app: webapp1
---
apiVersion: v1
kind: Service
metadata:
  name: webapp2-svc
  labels:
    app: webapp2
spec:
  ports:
  - port: 80
  selector:
    app: webapp2
---
apiVersion: v1
kind: Service
metadata:
  name: webapp3-svc
  labels:
    app: webapp3
spec:
  ports:
  - port: 80
  selector:
    app: webapp3
```


The YAML file below defines a nginx-based Ingress controller together with a service making it available on Port 80 to external connections using ExternalIPs. If the Kubernetes cluster was running on a cloud provider then it would use a LoadBalancer service type.

ingress.yaml
```yaml
apiVersion: v1
kind: ReplicationController
metadata:
  name: nginx-ingress-rc
  labels:
    app: nginx-ingress
spec:
  replicas: 1
  selector:
    app: nginx-ingress
  template:
    metadata:
      labels:
        app: nginx-ingress
    spec:
      containers:
      - image: nginxdemos/nginx-ingress:0.9.0
        name: nginx-ingress
        ports:
        - containerPort: 80
          hostPort: 80
---
apiVersion: v1
kind: Service
metadata:
  name: nginx-ingress-lb
  labels:
    app: nginx-ingress
spec:
  externalIPs:
  - 172.17.0.43
  ports:
  - port: 80
    name: http
    targetPort: 80
  selector:
    app: nginx-ingress
```

The Ingress controllers are deployed in a familiar fashion to other Kubernetes objects with
```
kubectl create -f ingress.yaml
```

Deploy ingress Rules

ingress rules are an object type with kubernetes. The rules can be based on a request host (domain), or the path of the request, or a combination of both.

ingress rules
```
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: webapp-ingress
spec:
  rules:
  - host: my.kubernetes.example
    http:
      paths:
      - path: /webapp1
        backend:
          serviceName: webapp1-svc
          servicePort: 80
      - path: /webapp2
        backend:
          serviceName: webapp2-svc
          servicePort: 80
      - backend:
          serviceName: webapp3-svc
          servicePort: 80
```

deploy rules
```
kubectl create -f ingress-rules.yaml
```

get ingress services
```
kubectl get ingress
```
