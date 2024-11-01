terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.13.0"
    }
  }
}

provider "docker" {}

resource "docker_image" "my_docker_image" {
  name         = "vlnnns/frontend:latest"  # Путь к образу Docker Hub
  keep_locally = false
}

resource "docker_container" "my_container" {
  name  = "my_container_name"
  image = docker_image.my_docker_image.latest

  ports {
    internal = 80
    external = 8080
  }

  env = [
    "ENV_VAR1=value1",
    "ENV_VAR2=value2"
  ]
}

