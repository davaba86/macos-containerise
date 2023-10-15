terraform() {
  : '
  # What
  Spawn container from Hashicorp official Terraform image.

  # Usage
  terraform --version
  terraform plan
  terraform apply
  terraform destroy
  '

  docker run \
  --rm \
  --volume $(PWD):/src/ \
  --workdir /src/ \
  --env AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID} \
  --env AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY} \
  --env AWS_SESSION_TOKEN=${AWS_SESSION_TOKEN} \
  --interactive \
  public.ecr.aws/hashicorp/terraform:1.6.0 "$@"
}
