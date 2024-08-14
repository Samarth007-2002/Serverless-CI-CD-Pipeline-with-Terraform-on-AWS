# Terraform CI/CD Pipeline

This repository contains a basic CI/CD pipeline setup using Terraform.

## Files Overview

- **backend.tf**: Configures the backend for storing Terraform state.
- **main.tf**: Contains the main infrastructure code.
- **variables.tf**: Defines the variables used in the Terraform scripts.
- **buildspec.yml**: Configuration file for setting up the CI/CD pipeline.

## How to Use

1. Clone the repository.
2. Update the variables in `variables.tf` to match your environment.
3. Update the buildspec.yml config gile according to your needs.
4. Create a s3 bucket for your state files.
5. Initalise , plan , validate and apply.
6. Go to CodePipeline and update the configuration by adding repo_hook to your repo.

## License

This project is open-source and available under the MIT License.
