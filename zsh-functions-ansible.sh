ansible-build() {
  : '
  # What
  Create Ansible Docker container from Python image under non-root user.

  # Usage
  ansible-build
  '

  docker build --tag ansible-local:latest --file Dockerfile .
}

ansible-exec() {
  : '
  # What
  Spawn container from image with tag ansible-local, created from ansible-build.

  # Usage
  ansible-exec
  '

  docker run \
	--rm \
	--interactive \
	--tty \
	--network host \
	--volume $(PWD):/src/ \
	--workdir /src/ \
	--entrypoint /bin/bash \
	ansible-local:latest
}

ansible() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible with arguments.

  # Usage
  ansible --version
  '

  docker run --rm \
    --volume $(PWD)/:/src/ \
    --workdir /src/ \
    --interactive \
    ansible-local ansible "$@"
}

ansible-playbook() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible-playbook with arguments.

  # Usage
  ansible-playbook --version
  '

  docker run --rm \
    --volume $(PWD)/:/src/ \
    --workdir /src/ \
    --interactive \
    ansible-local ansible-playbook "$@"
}

ansible-galaxy() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible-galaxy with arguments.

  # Usage
  ansible-galaxy collection list
  '

  docker run --rm \
    --volume $(PWD)/:/src/ \
    --workdir /src/ \
    --interactive \
    ansible-local ansible-galaxy "$@"
}
