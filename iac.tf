# Terraform configuration for building Docker images
# This configuration demonstrates infrastructure-as-code workflows
# by automating Docker image builds with Terraform

terraform {
  required_version = ">= 1.0"
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "~> 3.0"
    }
  }
}

# Configure the Docker provider
provider "docker" {
  host = "unix:///var/run/docker.sock"
}

# Local variables for configuration
locals {
  image_name = "copilot-server"
  image_tag  = "latest"
  app_port   = 8000
}

# Build the Docker image for the Rust server
resource "docker_image" "copilot_server" {
  name = "${local.image_name}:${local.image_tag}"
  build {
    context    = "${path.module}"
    dockerfile = "Dockerfile"
    tag        = ["${local.image_name}:${local.image_tag}"]
    label = {
      author      = "copilot-demo"
      description = "Rust TCP server built with Terraform"
      version     = "1.0.0"
    }
  }
  keep_locally = true
}

# Optional: Create and run a container from the built image
resource "docker_container" "copilot_server" {
  count = var.deploy_container ? 1 : 0
  image = docker_image.copilot_server.image_id
  name  = "copilot-server-container"
  
  ports {
    internal = local.app_port
    external = local.app_port
  }
  
  # Restart policy (cannot be used with rm = true)
  restart = "unless-stopped"
}

# Variable to control container deployment
variable "deploy_container" {
  description = "Whether to deploy the container after building the image"
  type        = bool
  default     = false
}

# Outputs
output "image_id" {
  description = "The ID of the built Docker image"
  value       = docker_image.copilot_server.image_id
}

output "image_name" {
  description = "The name and tag of the built Docker image"
  value       = "${local.image_name}:${local.image_tag}"
}

output "container_name" {
  description = "The name of the container (if deployed)"
  value       = var.deploy_container ? docker_container.copilot_server[0].name : null
}