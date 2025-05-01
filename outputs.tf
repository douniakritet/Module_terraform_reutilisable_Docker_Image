output "image_id" {
  value = docker_image.mon_image.id
}

output "container_name" {
  value = docker_container.mon_container.name
}
