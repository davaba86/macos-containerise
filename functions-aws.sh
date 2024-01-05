#!/bin/zsh

if [[ $(hostname -s) == "da-macbook-pro-mc" ]]; then
  aws() {
    : '
    # What
    Spawn container with latest tag from AWS official AWS CLI image.

    # Usage
    aws --version
    '

    docker run \
    --rm \
    --interactive \
    --tty \
    --volume "$(PWD)":/src/ \
    --workdir /src/ \
    --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
    amazon/aws-cli:latest "$@"
  }

  aws-exec() {
    : '
    # What
    Spawn container from image to build and test.

    # Usage
    ansible-exec
    '

    docker run \
    --rm \
    --interactive \
    --tty \
    --volume "$(PWD)":/src/ \
    --workdir /src/ \
    --env AWS_CONFIG_FILE="/root/.aws/config" \
    --env AWS_SHARED_CREDENTIALS_FILE="/root/.aws/credentials" \
    --entrypoint /bin/sh \
    amazon/aws-cli:latest
  }

  aws-eks-config-gen() {
    : '
    # What
    Spawn container with latest tag from AWS official AWS CLI image.

    # Usage
    aws-eks-config-gen --name dev-demo --region eu-west-1
    '

    docker run \
    --rm \
    --volume "$(PWD)":/src/ \
    --volume $HOME/.kube/config:/root/.kube/config \
    --workdir /src/ \
    --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
    --interactive \
    amazon/aws-cli:latest eks update-kubeconfig "$@"
  }
fi
