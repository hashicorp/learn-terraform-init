provider "docker" {}
provider "random" {}

resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.latest
  name  = "hello-terraform"
  ports {
    internal = 80
    external = 8000
  }
}

resource "random_pet" "dog" {
  length = 2
}

module "nginx-pet" {
  source = "./nginx"

  container_name = "hello-${random_pet.dog.id}"
  nginx_port = 8001
}

module "hello" {
  source  = "joatmon08/hello/random"
  version = "3.0.1"

  hello = random_pet.dog.id

	secret_key = "secret"
}
