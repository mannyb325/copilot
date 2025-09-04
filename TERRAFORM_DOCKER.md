# Terraform Docker Configuration

This Terraform configuration provides a modular and reusable solution for building and deploying Docker images. It automates the Docker image creation process and optionally creates containers for immediate deployment.

## Features

- **Modular Design**: Reusable Terraform module for Docker image management
- **Customizable**: Support for image names, tags, build contexts, and build arguments
- **Flexible Deployment**: Optional container creation with port mapping and environment variables
- **Best Practices**: Follows Terraform and Docker best practices
- **Trigger-based Rebuilds**: Automatically rebuilds images when Dockerfile changes

## Prerequisites

- [Terraform](https://www.terraform.io/downloads.html) >= 1.0
- [Docker](https://docs.docker.com/get-docker/) installed and running
- Docker daemon accessible (default: unix:///var/run/docker.sock)

## Quick Start

1. **Clone and navigate to the repository:**
   ```bash
   git clone <repository-url>
   cd copilot
   ```

2. **Initialize Terraform:**
   ```bash
   terraform init
   ```

3. **Create a terraform.tfvars file:**
   ```bash
   cp terraform.tfvars.example terraform.tfvars
   # Edit terraform.tfvars with your configuration
   ```

4. **Plan and apply:**
   ```bash
   terraform plan
   terraform apply
   ```

## Configuration Variables

### Required Variables
- `image_name`: Name of the Docker image to build (default: "demo-app")
- `image_tag`: Tag for the Docker image (default: "latest")

### Optional Variables
- `docker_host`: Docker daemon host (default: "unix:///var/run/docker.sock")
- `build_context`: Build context path (default: ".")
- `dockerfile_path`: Path to Dockerfile (default: "Dockerfile")
- `build_args`: Build arguments as key-value pairs
- `labels`: Labels to apply to the image
- `create_container`: Whether to create a container (default: false)
- `container_port`: Internal container port (default: 8080)
- `external_port`: External port mapping (default: 8080)
- `restart_policy`: Container restart policy (default: "unless-stopped")
- `environment_variables`: List of environment variables

## Usage Examples

### Example 1: Build Image Only
```hcl
# terraform.tfvars
image_name = "my-web-app"
image_tag  = "v1.0.0"
build_context = "."
```

### Example 2: Build Image with Custom Build Args
```hcl
# terraform.tfvars
image_name = "my-api"
image_tag  = "latest"

build_args = {
  NODE_ENV = "production"
  API_VERSION = "v2"
}

labels = {
  maintainer = "devops@company.com"
  project    = "web-api"
}
```

### Example 3: Build Image and Create Container
```hcl
# terraform.tfvars
image_name = "my-app"
image_tag  = "v1.0.0"

create_container = true
container_port   = 3000
external_port    = 8080

environment_variables = [
  "NODE_ENV=production",
  "PORT=3000",
  "DATABASE_URL=postgres://localhost:5432/mydb"
]
```

### Example 4: Multi-environment Setup
```hcl
# dev.tfvars
image_name = "my-app"
image_tag  = "dev"
create_container = true
external_port = 8080

# prod.tfvars
image_name = "my-app"
image_tag  = "v1.0.0"
create_container = true
external_port = 80

build_args = {
  ENV = "production"
}
```

Deploy with: `terraform apply -var-file="dev.tfvars"`

## Outputs

- `image_id`: ID of the built Docker image
- `image_name`: Full name of the built Docker image
- `container_id`: ID of the created container (if created)
- `container_ip`: IP address of the created container (if created)

## File Structure

```
.
├── iac.tf                      # Main Terraform configuration
├── terraform.tfvars.example   # Example variables file
├── Dockerfile                 # Sample Dockerfile
├── app.py                     # Sample Python application
├── requirements.txt           # Python dependencies
└── TERRAFORM_DOCKER.md       # This documentation
```

## Best Practices

1. **Version Control**: Always version your Terraform configurations
2. **State Management**: Use remote state for team environments
3. **Variable Files**: Use `.tfvars` files for environment-specific configurations
4. **Resource Tagging**: Use labels for better resource organization
5. **Security**: Avoid hardcoding sensitive values in configuration files

## Troubleshooting

### Common Issues

1. **Docker daemon not accessible:**
   ```
   Error: Cannot connect to the Docker daemon
   ```
   **Solution**: Ensure Docker is running and accessible via the configured `docker_host`

2. **Dockerfile not found:**
   ```
   Error: Dockerfile not found
   ```
   **Solution**: Verify the `dockerfile_path` and `build_context` variables

3. **Port already in use:**
   ```
   Error: Port is already allocated
   ```
   **Solution**: Change the `external_port` or stop the conflicting container

### Debug Commands

```bash
# Check Docker connectivity
docker version

# List existing images
docker images

# List running containers
docker ps

# View Terraform state
terraform show

# Validate configuration
terraform validate
```

## Security Considerations

- Keep Docker daemon secure and properly configured
- Use specific image tags instead of `latest` in production
- Regularly update base images for security patches
- Scan images for vulnerabilities before deployment
- Use secrets management for sensitive environment variables

## Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test the configuration
5. Submit a pull request

## License

This configuration is provided as-is for demonstration purposes. Modify according to your needs and security requirements.