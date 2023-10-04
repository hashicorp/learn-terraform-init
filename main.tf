# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

provider "aws" {
  region = var.region
}

provider "random" {}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-bionic-18.04-amd64-server-*"]
  }

  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

resource "random_pet" "instance" {
  length = 2
}

module "ec2-instance" {
  source = "./modules/aws-ec2-instance"

  ami_id        = data.aws_ami.ubuntu.id
  instance_name = random_pet.instance.id
}

module "hello" {
  source  = "joatmon08/hello/random"
  version = "4.0.0"

  hello        = "World"
  second_hello = random_pet.instance.id

  secret_key = "secret"
}
