# Copyright (c) HashiCorp, Inc.
# SPDX-License-Identifier: MPL-2.0

variable "container_name" {
  type = string
  description = "NGINX container's name"
}

variable "nginx_port" {
  type = number
  description = "NGINX container's external port number"
}