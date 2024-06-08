terraform {
  required_providers {
    docker = {
      source = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {}

resource "docker_image" "nginx_image_test" {
  name         = "nginx:latest"
  keep_locally = false
}

resource "docker_container" "nginx_container_test" {
  image = docker_image.nginx_image_test.name
  name  = "container_nginx_test"
  ports {
    internal = 80
    external = 8001
  }
}
