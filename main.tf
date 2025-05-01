terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
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
