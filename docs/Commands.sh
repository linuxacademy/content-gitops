![la logo](https://user-images.githubusercontent.com/42839573/67322755-818e9400-f4df-11e9-97c1-388bf357353d.png)

## Hands-On GitOps

### This document contains a number of commands that may prove useful to the student.

# Install Flux
sudo snap install fluxctl
sudo snap install --classic

# To check that fluxctl is installed and kubernetes
fluxctl version
kubectl version

# To check the kubernetes cluster that is staged.
kubctl get nodes

# Hads-on
#Create a namespace called flux.
kubectl create namespace flux

# Deploy the flux pods to a cluster within the flux namespace and GitLab Lab.
#https://gitlab.com/josefloressv/flux-sample
export GLUSER=josefloressv
env | grep GL

fluxctl install \
--git-user=${GLUSER} \
--git-email=${GLUSER}@gmail.com \
--git-url=git@gitlab.com:${GLUSER}/flux-sample \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -


# Deploy the flux pods to a cluster within the flux namespace and GitHub.
#https://github.com/josefloressv/content-gitops
export GHUSER=josefloressv
env | grep GH

fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/content-gitops \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -

# https://github.com/josefloressv/manifest_with_flux
fluxctl install \
--git-user=${GHUSER} \
--git-email=${GHUSER}@users.noreply.github.com \
--git-url=git@github.com:${GHUSER}/manifest_with_flux \
--git-branch=main \
--git-path=namespaces,workloads \
--namespace=flux | kubectl apply -f -

# Interogate the RSA Key created by the flux install.
fluxctl identity --k8s-fwd-ns flux
# Yo need to add this key to your repository keys in GitHub or SSH Keys on GitLab

# Check the status & log of the flux deployment for troubleshootings.
kubectl -n flux rollout status deployment/flux
kubectl -n flux logs deployment/flux

# Sync flux with the repo.
fluxctl sync --k8s-fwd-ns flux

# Get pods from the namespace
kubectl -n flux get pods

# describe a specific pod such as hello-75d7f49d9b-t8bpr
kubectl -n flux describe pod flux-6854987774-6fbht




# Set an environment variable to tell fluxctl the namespace that flux is running in,
# allowing to execute the flux command without specified the namespace, like a default namespace
export FLUX_FORWARD_NAMESPACE=flux

# Sync flux with the repo. Note: the command use the default namespace in FLUX_FORWARD_NAMESPACE
fluxctl sync


# List flux workloads
fluxctl list-workloads
fluxctl list-workloads --all-namespaces
fluxctl -n lamanifestjf list-workloads
kubectl get pods --all-namespaces

# list images running as flux workloads
fluxctl list-images
fluxctl -n lamanifestjf list-images

#and... (specify namespace and deployment name, such as lamanifestjf and hello)
fluxctl list-images --workload lamanifestjf:deployment/hello

# Get pods.
kubectl -n lamanifestjf get pods

# Describe a specific pod such as hello-75d7f49d9b-t8bpr
kubectl -n lamanifestjf describe pod/hello-75d7f49d9b-t8bpr

# Add automation to an existing YAML file with flux:
# This will make a commit to github https://github.com/josefloressv/manifest_with_flux/blob/main/workloads/hello.yaml
fluxctl automate --workload=lamanifestjf:deployment/hello

#The command to use fluxctl to reference a particular image stored in Docker Hub is:
#change version of the app https://hub.docker.com/r/linuxacademycontent/gitops/tags?page=1&ordering=last_updat
kubectl get pods -n lamanifestjf
fluxctl release --workload=lamanifestjf:deployment/hello --update-image=linuxacademycontent/gitops:hellov1.2
kubectl get pods -n lamanifestjf

#The command to remove automation from an existing deployment YAML is:
fluxctl deautomate --workload=lamanifestjf:deployment/hello

#To delete a namespace and all running pods within it:
kubectl delete namespace [namespace]
#Note: This can be used to remove the flux deployment in your lab Kubernetes cluster.

### Git Commands

#The following command is used to set the username foe the git cli to access GitHub.
git config --global user.name "Your Username"

#The following command will set the e-mail address required.
git config --global user.email "Your Username@users.noreply.github.com"

