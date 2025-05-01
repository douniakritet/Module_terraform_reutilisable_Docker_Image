terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  # host = "tcp://localhost:2375"  ← Cette ligne doit être commentée ou supprimée
}

resource "docker_image" "mon_image" {
  name = var.image_name

  build {
    context    = path.module
    dockerfile = "./Dockerfile"
  }
}

resource "docker_container" "mon_container" {
  name  = var.container_name
  image = docker_image.mon_image.name
}
