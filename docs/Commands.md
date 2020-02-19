![la logo](https://user-images.githubusercontent.com/42839573/67322755-818e9400-f4df-11e9-97c1-388bf357353d.png)

## Hands-On GitOps

### This document contains a number of commands that may prove useful to the student.

This is the command to install fluxctl on an Ubuntu server.
> Note: After the publication of this course, the maintainers of snap added the confinement security feature. Depending on Weavework's maintenance of the fluxctl binaries in the snap repositories, it may be necessary to add the "--classic" flag to the flux install command.

```
$ sudo snap install fluxctl
```
or
```
$ sudo snap install --classic
```
To check that fluxctl is installed:

```
$ fluxctl version
```
> Note: At the time of the publication of this course, the binaries in the snap repo were an unversioned version. You may have a different response when you take the course.

This is the command to check the kubernetes cluster that is staged.

```
$ kubctl get nodes
```

This is the command to create a namespace called flux.

```
$ kubectl create namespace flux
```

The following is the fluxctl install command used to deploy the flux pods to a cluster within the flux namespace. This is the example used in the "Installing with GitHub Lab".

```
$ fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/content-gitops \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -
```
The version of this command used in the "Installing with GitLab Lab" is:

```
$ export GLUSER=[your GitLab username]
```    
Then input the command to run flux:
```
$ fluxctl install \
--git-user=${GLUSER} \
--git-email=${GLUSER}@gmail.com \
--git-url=git@gitlab.com:${GLUSER}/flux-sample \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -
```
> Note: In the above sample 'flux-sample' is an example repo name. You would use the actual url for the repo you wish Flux to scan.

This is the command to check the status of the flux deployment.

```
$ kubectl -n flux rollout status deployment/flux
```

This is the command to interogate the RSA Key created by the flux install.

```
$ fluxctl identity --k8s-fwd-ns flux
```

This is the command to cause flux to sync with the repo.

```
$ fluxctl sync --k8s-fwd-ns flux
```

This is the command to set an environment variable to tell fluxctl the namespace that flux is running in.

```
$ export FLUX_FORWARD_NAMESPACE=flux
```

This is the command to list flux workloads

```
$ fluxctl list-workloads
```
and...
```
$ fluxctl list-workloads --all-namespaces
```
and...
```
$ fluxctl -n lasample list-workloads
```

This is the command to list images running as flux workloads
```
$ fluxctl list-images
```
and... (specify namespace and deployment name, such as lasample and hello)
```
$ fluxctl list-images --workload lasample:deployment/hello
```

This is the command to get pods.
```
$ kubectl -n lasample get pods
```

This is the command to describe a specific pod such as hello-75d7f49d9b-t8bpr
```
$ kubectl -n lasample describe pod/hello-75d7f49d9b-t8bpr
```

The command to use fluxctl to add automation to an existing YAML file is:
```
$ fluxctl automate --workload=lamanifest:deployment/hello
```

The command to use fluxctl to reference a particular image stored in Docker Hub is:
```
$ fluxctl release --workload=lamanifest:deployment/hello --update-image=linuxacademycontent/gitops:hellov1.2
```

The command to remove automation from an existing deployment YAML is:
```
$ fluxctl deautomate --workload=lasample:deployment/hello
```

To delete a namespace and all running pods within it:

```
$ kubectl delete namespace [namespace]
```
Note: This can be used to remove the flux deployment in your lab Kubernetes cluster.

### Git Commands

The following command is used to set the username foe the git cli to access GitHub.

```
$ git config --global user.name "Your Username"
```

The following command will set the e-mail address required.

```
$ git config --global user.email "Your Username@users.noreply.github.com"
```

