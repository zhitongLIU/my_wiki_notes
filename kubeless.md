# Kubeless

NEED: create name space `kubeless`
```bash
kubectl create ns kubeless
```

because this yaml will create all in `kubeless` namespace
Install
```bash
curl -sL https://github.com/kubeless/kubeless/releases/download/v0.3.0/kubeless-rbac-v0.3.0.yaml | kubectl create -f -
```

list pods under namespace
```bash
kubectl get pods -n kubeless
```
which should contain kubeless controller

deploy python function with http trigger
```bash
kubeless function deploy toy --runtime python2.7 \
                              --handler toy.handler \
                              --from-file toy.py \
                              --trigger-http
```
example of toy.py
```python
def handler(event):
   print event.json
   return event.json
```


list deployed functions
```bash
kubeless function ls
```

when a function is deployed a pods will be created
```bash
kubectl get pods
```

example:
```bash
master $ kubectl get pods
NAME                  READY     STATUS    RESTARTS   AGE
toy-9dc5b4c86-v587q   1/1       Running   0          7m
```

call a function with params with kubeless
```bash
kubeless function call toy --data '{"hello":"world"}'
```

launch proxy  to port 8080
```bash
kubectl proxy --port 8080 &
```

then we could curl from it
```bash
curl --data '{"hello":"world"}' localhost:8080/api/v1/proxy/namespaces/default/services/toy:8080/ --header "Content-Type:application/json"
```

list logs of function
```bash
kubeless function logs toy
```

describe function
```bash
kubeless function describe toy
```

update function from file
```bash
kubeless function update toy --from-file toy-update.py
```

delete function
```bash
kubeless function delete toy
```
