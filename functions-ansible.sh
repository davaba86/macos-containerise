#!/bin/zsh

ansible-exec() {
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
	--network host \
	--volume "$(PWD)":/src/ \
	--workdir /src/ \
	--entrypoint /bin/sh \
	davaba/ansible:latest
}

ansible() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible with arguments.

  # Usage
  ansible --version
  '

  docker run \
    --rm \
    --volume "$(PWD)"/:/src/ \
    --workdir /src/ \
    --interactive \
    davaba/ansible ansible "$@"
}

ansible-playbook() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible-playbook with arguments.

  # Usage
  ansible-playbook --version
  '

  docker run \
    --rm \
    --volume "$(PWD)"/:/src/ \
    --workdir /src/ \
    --interactive \
    davaba/ansible ansible-playbook "$@"
}

ansible-galaxy() {
  : '
  # What
  Spawn container from image with tag ansible-local in order to run ansible-galaxy with arguments.

  # Usage
  ansible-galaxy collection list
  '

  docker run \
    --rm \
    --volume "$(PWD)"/:/src/ \
    --workdir /src/ \
    --interactive \
    davaba/ansible ansible-galaxy "$@"
}
