resource "docker_image" "nginx" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx" {
  image = docker_image.nginx.repo_digest
  name  = var.container_name
  ports {
    internal = 80
    external = var.nginx_port
  }
}
