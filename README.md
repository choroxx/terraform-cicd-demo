# Terraform CI/CD Demo

This repository demonstrates a minimal, automated CI/CD pipeline for Infrastructure as Code (IaC) utilizing Terraform, GitHub Actions, and Docker.

##Architecture & Workflow

1. **Code Push**: Developer pushes Terraform code to the `main` branch.
2. **CI (Continuous Integration)**: 
   - `terraform fmt -check` validates code formatting.
   - `terraform validate` checks for logical errors.
   - `terraform plan` generates an execution plan.
3. **CD (Continuous Deployment)**: Automatically triggers deployment and controls the Docker container infrastructure.

##Tech Stack

- **Infrastructure as Code**: Terraform (>= 1.5.0)
- **CI/CD Platform**: GitHub Actions
- **Target Provider**: Docker ( Kreuzwerker Provider )

## Architectural Decisions
- **State Persistence**: Configured the backend to `local` to maintain state tracking, ensuring Terraform can accurately manage resource lifecycles and handle idempotency.
- **Workflow Decoupling**: Separated the pipeline into `plan` and `apply` jobs. This enforces a manual review step, allowing for verification of the execution plan before any infrastructure changes are applied to production environments.