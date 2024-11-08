terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 2.24.0"
    }
  }
}

provider "docker" {}


resource "docker_registry_image" "frontend_image" {
  name = "vlnnns/frontend:latest" 
  build {
    context    = "./"
    dockerfile = "Dockerfile-Frontend"
  }
  
  keep_locally = false
}

resource "docker_container" "frontend_container" {
  name  = "frontend_container"
  image = docker_registry_image.frontend_image.name

  ports {
    internal = 80
    external = 8080
  }

  env = [
    "ENV_VAR1=value1",
    "ENV_VAR2=value2"
  ]
}
