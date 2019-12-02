### This file contains other YAML that helps the student with the lessons and labs in Linux Academy's Hands-On GitOps Course

The following is a YAML file to create a deployment of the sample Python Application.

```
apiVersion: apps/v1
kind: Deployment
metadata:
  name: hello
  namespace: lasample
  labels:
    app: hello
spec:
  selector:
    matchLabels:
      app: hello
  template:
    metadata:
      labels:
        app: hello
    spec:
      containers:
      - name: hello
        image: linuxacademycontent/gitops:hellov1.0
```

The following is a sample YAML file to create a Service for the hello application.

```
kind: Service
apiVersion: v1
metadata:
  name: hello-service
  namespace: lasample
spec:
  selector:
    app: hello
  ports:
  - protocol: TCP
    port: 8000
    nodePort: 32321
  type: NodePort
```


