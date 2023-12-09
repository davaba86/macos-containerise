# macOS Containerise

- [1. Overview](#1-overview)
- [2. Deployment](#2-deployment)
  - [2.1. Verification](#21-verification)
  - [2.2. How to Use](#22-how-to-use)
- [3. Projects](#3-projects)
  - [3.1. Ansible](#31-ansible)
  - [3.2. AWS CLI](#32-aws-cli)
  - [3.3. Terraform](#33-terraform)
  - [3.4. Kubernetes](#34-kubernetes)
- [4. Future Work](#4-future-work)

## 1. Overview

I'm a big fan of containerisation and the more I use it the more I love the fact that you can segment packaging in order to not clutter your OS.

Take Ansible for e.g. where you need to install several packages so instead of cluttering my OS I run it directly from Docker.

## 2. Deployment

### 2.1. Verification

To verify that the functions are responsing to the base commands such as aws, terraform etc. use that which command.

```shell
which aws
```

This would result in you seeing the zsh function in the output rather than the path to the executable.

### 2.2. How to Use

I use dotfiles and keep configurations in a structure where in my case ZSH functions and customisations are located in `~/dotfiles/zsh/.zshrc/`.

```bash
ln -s ~/git-repos/macos-containerise/functions-ansible.sh \
  ~/dotfiles/zsh/.zshrc.d/functions-ansible.zshrc
ln -s ~/git-repos/macos-containerise/functions-aws.sh \
  ~/dotfiles/zsh/.zshrc.d/functions-aws.zshrc
ln -s ~/git-repos/macos-containerise/functions-terraform.sh \
  ~/dotfiles/zsh/.zshrc.d/functions-terraform.zshrc
ln -s ~/git-repos/macos-containerise/functions-kubernetes.sh \
  ~/dotfiles/zsh/.zshrc.d/functions-kubernetes.zshrc
```

> Rememver that every time you make a change to a function that's read by your shell you need to reload the sesison, e.g. for ZSH `source ~/.zshrc"`.

## 3. Projects

### 3.1. Ansible

GitHub: https://github.com/davaba86/docker-ansible
DockerHub: davaba/ansible

### 3.2. AWS CLI

When spawning a container from the official AWS image be aware of that your credentials need to be forwarded to the container.

I for e.g. use [awsume](https://awsu.me) to authenticate to AWS and once the ENV VARs are set I forward them to the container.

Have a look at `functions-aws-cli.sh` for more details on the usage.

### 3.3. Terraform

GitHub: https://github.com/davaba86/docker-terraform
DockerHub: davaba/terraform

Since I use AWS I ensure the ENVs AWS_ACCESS_KEY_ID, AWS_SECRET_ACCESS_KEY and AWS_SESSION_TOKEN as passed into the container from the host.

I recommend to use [awsume](https://awsu.me) to easely manage AWS profiles instead of creating your own scripts.

Also if you are triggering the commands from different paths then make use of `-chdir` and `--terragrunt-working-dir`.

```bash
terraform -chdir=infra-live-v2/dev/vpc init
terraform -chdir=infra-live-v2/dev/vpc apply -auto-approve
```

```bash
terragrunt init --terragrunt-working-dir infra-live-v3/dev/vpc
terragrunt apply --terragrunt-working-dir infra-live-v3/dev/vpc -auto-approve
terragrunt run-all destroy
```

### 3.4. Kubernetes

GitHub: https://github.com/davaba86/docker-kubernetes
DockerHub: davaba/kubernetes

## 4. Future Work

- [ ] Python
- [ ] Firefox
- [ ] Chrome
- [ ] Spotify
