# Terraform Configuration for Docker Image Management
# This configuration provides a modular approach to building and deploying Docker images

terraform {
  required_version = ">= 1.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the Docker Provider
provider "docker" {
  host = var.docker_host
}

# Variables for customization
variable "docker_host" {
  description = "Docker daemon host"
  type        = string
  default     = "unix:///var/run/docker.sock"
}

variable "image_name" {
  description = "Name of the Docker image to build"
  type        = string
  default     = "demo-app"
}

variable "image_tag" {
  description = "Tag for the Docker image"
  type        = string
  default     = "latest"
}

variable "build_context" {
  description = "Build context path for Docker image"
  type        = string
  default     = "."
}

variable "dockerfile_path" {
  description = "Path to the Dockerfile"
  type        = string
  default     = "Dockerfile"
}

variable "build_args" {
  description = "Build arguments for Docker image"
  type        = map(string)
  default     = {}
}

variable "labels" {
  description = "Labels to apply to the Docker image"
  type        = map(string)
  default     = {}
}

# Build Docker Image
resource "docker_image" "app_image" {
  name = "${var.image_name}:${var.image_tag}"
  
  build {
    context    = var.build_context
    dockerfile = var.dockerfile_path
    build_args = var.build_args
    label      = var.labels
  }
  
  triggers = {
    dockerfile_sha = filesha256("${var.build_context}/${var.dockerfile_path}")
  }
}

# Optional: Create a container from the image
resource "docker_container" "app_container" {
  count = var.create_container ? 1 : 0
  
  image = docker_image.app_image.name
  name  = "${var.image_name}-container"
  
  ports {
    internal = var.container_port
    external = var.external_port
  }
  
  restart = var.restart_policy
  
  env = var.environment_variables
}

variable "create_container" {
  description = "Whether to create a container from the image"
  type        = bool
  default     = false
}

variable "container_port" {
  description = "Internal port for the container"
  type        = number
  default     = 8080
}

variable "external_port" {
  description = "External port mapping for the container"
  type        = number
  default     = 8080
}

variable "restart_policy" {
  description = "Restart policy for the container"
  type        = string
  default     = "unless-stopped"
}

variable "environment_variables" {
  description = "Environment variables for the container"
  type        = list(string)
  default     = []
}

# Outputs
output "image_id" {
  description = "ID of the built Docker image"
  value       = docker_image.app_image.id
}

output "image_name" {
  description = "Full name of the built Docker image"
  value       = docker_image.app_image.name
}

output "container_id" {
  description = "ID of the created container (if created)"
  value       = var.create_container ? docker_container.app_container[0].id : null
}

output "container_ip" {
  description = "IP address of the created container (if created)"
  value       = var.create_container ? docker_container.app_container[0].network_data[0].ip_address : null
}
