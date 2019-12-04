![la logo](https://user-images.githubusercontent.com/42839573/67322755-818e9400-f4df-11e9-97c1-388bf357353d.png)

### Using Manifests With Flux

### Lab Scenario

Your manager is interested in using Flux to synchronize a Kubernetes Cluster with Kubernetes Manifests stored in a GitHub Repo. The Development Organization has pushed several releases of an application called 'Hello' to docker hub. The team would like you to set up a repository with the YAML required to create a namespace and deploy the container image on docker hub.

#### For your use:

Sample commands may be found in the Commands.md file within this repo.
Sample YAML may be found in the Sample_YAML.md file within this repo.

#### Hint:
The YAML provided references a namespace and a container image. They may not be 'ready for production' based on the images that have been pushed and tagged in Docker Hub.

You will want to use the fluxctl automate and release commands to make the YAML work, and you will also need to be sure the namespace that you create is the same as the namespace referenced in the workloads deployment YAML.

The Docker hub Link is:
https://hub.docker.com/repository/docker/linuxacademycontent/gitops

Good Luck!
