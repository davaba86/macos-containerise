#!/bin/zsh

terraform-exec() {
  : '
  # What
  Spawn container from image with tag terragrunt-local, created from terragrunt-build.

  # Usage
  terragrunt-exec
  '

  docker run \
	--rm \
	--interactive \
	--tty \
	--network host \
	--volume "$(PWD)":/src/ \
	--workdir /src/ \
	--entrypoint /bin/sh \
  --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
	davaba/terraform:latest
}

terraform() {
  : '
  # What
  Spawn container with specific TF version from Hashicorp official TF image.

  # Usage
  terraform --version
  terraform plan
  terraform apply
  terraform destroy
  '

  docker run \
  --rm \
  --interactive \
  --volume "$(PWD)":/src/ \
  --workdir /src/ \
  --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
  --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
  --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
  davaba/terraform:latest terraform "$@"
}

terragrunt() {
  : '
  # What
  Spawn container from image with tag terragrunt-local in order to run terragrunt with arguments.

  # Usage
  terragrunt --version
  '

  docker run \
    --rm \
    --interactive \
    --volume "$(PWD)"/:/src/ \
    --workdir /src/ \
    --env AWS_ACCESS_KEY_ID="${AWS_ACCESS_KEY_ID}" \
    --env AWS_SECRET_ACCESS_KEY="${AWS_SECRET_ACCESS_KEY}" \
    --env AWS_SESSION_TOKEN="${AWS_SESSION_TOKEN}" \
    davaba/terraform:latest terragrunt "$@"
}
