resource "random_string" "name" {
  length  = 4
  special = false
}

variable "aws_region" {
  description = "The AWS region that this Keypair will be deployed to"
  type = string
}

variable "kms_key_id" {
  description = "The KMS Key that will encrypt the AWS Key Pair secret"
  type = string
}

variable "project_name" {
  description = "The name of the project that this key pair will be deployed for"
  type = string
}

variable "tags" {
  description = "A map of tags assigned to the resource"
  type = map(string)
  default = {}
}

