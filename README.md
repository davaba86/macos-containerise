# macOS Containerise

- [1. Overview](#1-overview)
- [2. Deployment](#2-deployment)
  - [2.1. Verification](#21-verification)
- [3. Projects](#3-projects)
  - [3.1. AWS CLI](#31-aws-cli)
  - [3.2. Terraform](#32-terraform)
  - [3.3. Ansible](#33-ansible)
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

## 3. Projects

### 3.1. AWS CLI

When spawning a container from the official AWS image be aware of that your credentials need to be forwarded to the container.

I for e.g. use [awsume](https://awsu.me) to authenticate to AWS and once the ENV VARs are set I forward them to the container.

Have a look at `zsh-functions-aws-cli.sh` for more details on the usage.

### 3.2. Terraform

With regards to the authentication I use the same principal as with the AWS CLI container spawned from the image.

Have a look at `zsh-functions-terraform.sh` for more details on the usage.

### 3.3. Ansible

In order to start using the Dockerfile you also need to build an image from it as well as spawn containers via shell functions.

Have a look at `zsh-functions-ansible.sh` for more details on the usage.

## 4. Future Work

- [ ] Chrome
- [ ] Firefox
- [ ] Kubernetes
- [ ] Python
- [ ] Spotify
- [ ] shell script to add function files as syn links into ~/.zshrc.d/ to create one source of truth
