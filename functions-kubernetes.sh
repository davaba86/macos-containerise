#!/bin/zsh

kubernetes-exec() {
  : '
  # What
  Spawn container from image to build and test.

  # Usage
  kubernetes-exec
  '

  docker run \
	--rm \
	--interactive \
	--tty \
	--network host \
	--volume "$(PWD)":/src/ \
	--workdir /src/ \
	--entrypoint /bin/sh \
	davaba/kubernetes:latest
}

kubectl() {
  : '
  # What
  Run kubectl from within Docker container.

  # Example Usage
  kubectl version --client --output=yaml
  '

  docker run \
    --rm \
    --interactive \
    --volume $HOME/.kube:/root/.kube \
    --add-host=host.docker.internal:0.0.0.0 \
    davaba/kubernetes:latest \
    kubectl "$@"
}
