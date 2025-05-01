variable "image_name" {
  description = "Nom de l'image Docker"
  type        = string
  default     = "mon_image1:test"
}

variable "container_name" {
  description = "Nom du container Docker"
  type        = string
  default     = "mon_container"
}
