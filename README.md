# macOS Containerise

- [1. Overview](#1-overview)
- [2. Projects](#2-projects)
  - [2.1. Terraform](#21-terraform)
  - [2.2. Ansible](#22-ansible)
- [3. Future Work](#3-future-work)

## 1. Overview

I'm a big fan of containerisation and the more I use it the more I love the fact that you can segment packaging in order to not clutter your OS.

Take Ansible for e.g. where you need to install several packages so instead of cluttering my OS I run it directly from Docker.

## 2. Projects

### 2.1. Terraform

When spawning a container from the official Hashicorp image be aware of that your credentials need to be forwarded to the container.

I for e.g. use awsume to authenticate to AWS and once the ENV VARs are set I forward them to the container.

Have a look at `zsh-functions-terraform.sh` for more details on the usage.

### 2.2. Ansible

In order to start using the Dockerfile you also need to build an image from it as well as spawn containers via shell functions.

Have a look at `zsh-functions-ansible.sh` for more details on the usage.

## 3. Future Work

- [ ] AWS CLI
- [ ] Chrome
- [ ] Firefox
- [ ] Kubernetes
- [ ] Python
- [ ] Spotify
- [ ] shell script to add function files as syn links into ~/.zshrc.d/ to create one source of truth
