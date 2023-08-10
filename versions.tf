terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.21.0"
    }

    random = {
      source  = "hashicorp/random"
      version = "~> 3.1.0"
    }
  }
}
