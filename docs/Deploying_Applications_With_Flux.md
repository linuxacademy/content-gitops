![la logo](https://user-images.githubusercontent.com/42839573/67322755-818e9400-f4df-11e9-97c1-388bf357353d.png)

### Deploying Applications With GitHub Actions Workflow and Flux

### Lab Scenario

Your manager is impressed with Flux and wants to expand the proof-of-concept work you are doing beyond using Flux on a Development Server. He has asked you to setup a demo for some of the Operations and Engineering team to show how Flux can be used to promote workloads from Development, to Test and Production environments.

#### For your use:

The course repository linuxacademy/content-gitops has a sample yaml files.
There are also documents in the docs directory with YAML, and a Commands file.

#### Hint:
If you have a repository from a prior lab in this course, then you can use it. Otherwise you may want to fork the linuxacademy/content-gitops repo.

There are many ways to complete this task, but it is suggested that you use folders in the repository for QA and Production, to house the YAML for these upper environments. Then it is possible to configure Flux on the target environments to synchronize just the relevant YAML for that environment.

The Docker hub repository with container images already built is at this Link:

https://hub.docker.com/repository/docker/linuxacademycontent/gitops

Good Luck!
