![la logo](https://user-images.githubusercontent.com/42839573/67322755-818e9400-f4df-11e9-97c1-388bf357353d.png)

### Using Pull Requests For Release Gating

### Lab Scenario

Your manager is interested in using Flux to synchronize a Kubernetes Cluster with Kubernetes Manifests stored in a GitHub Repo. The Development Organization needs to push releases of their application up to Docker Hub so they can be deployed by Flux. The team would like you to set up a repository with the YAML required to use GitHub Actions Workflow to build the container, tag it, and push it to Docker Hub.

#### For your use:

The course repository linuxacademy/content-gitops has a sample workflow file as well as a Python application called hello in the python directory.

#### Hint:
You will need to fork the Linux Academy repo to your own GitHub Account. You will also need an account on Docker Hub to push container images to.

The Docker hub Link is:
https://hub.docker.com/repository/docker/linuxacademycontent/gitops

Good Luck!

### SPECIAL INSTRUCTIONS

For the workflow that has been setup to work properly, you will need to substitute your username into the workflow where the docker login command is done. You will also need to add a secret to your github repo for the Docker Hub password. It is suggested you add your dockerhub password as a secret named DOCKERPW in your github repo.


