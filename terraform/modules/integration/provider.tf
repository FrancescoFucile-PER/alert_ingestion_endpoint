provider "aws" {
  region = var.aws_region
  profile = var.aws_profile
}

variable "aws_region" {
  type = string
}

variable "aws_profile" {
  type = string
}