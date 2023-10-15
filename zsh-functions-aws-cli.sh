aws() {
  : '
  # What
  Spawn container with latest tag from AWS official AWS CLI image.

  # Usage
  aws --version
  '

  docker run \
  --rm \
  --volume $(PWD):/src/ \
  --workdir /src/ \
  --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN} \
  --interactive \
  amazon/aws-cli:latest "$@"
}
