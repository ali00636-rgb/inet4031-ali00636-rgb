# Week 5 - OpenTofu and k3s

## Overview
In this lab, I used OpenTofu to deploy an IT Helpdesk application and PostgreSQL database to my k3s Kubernetes cluster.

## Infrastructure
The application includes:
- Flask web application
- PostgreSQL 16 database
- Kubernetes Deployments and Services
- PersistentVolumeClaim for database storage
- ConfigMap for application settings
- Secret for sensitive information

## Deployment
I used OpenTofu commands to manage the infrastructure:

1. tofu init
2. tofu fmt
3. tofu validate
4. tofu plan
5. tofu apply

## Testing
I verified that all Kubernetes pods were running and the web application worked at http://localhost:8080.

I also tested infrastructure drift by manually scaling the web deployment to three replicas. OpenTofu detected the difference and proposed restoring it to two replicas.

## Database Persistence
I created a test ticket and restarted the PostgreSQL deployment. The ticket remained available after the restart, confirming that persistent storage was working.

## Security
Sensitive values are stored in terraform.tfvars, which is excluded from Git. OpenTofu state files and the .terraform directory are also ignored.

## Conclusion
This lab helped me understand Infrastructure as Code, Kubernetes deployment management, state files, and infrastructure drift.
