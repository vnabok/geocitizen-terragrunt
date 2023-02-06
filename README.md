# geocitizen-terragrunt

## Overview

This terraform code will deploy Geocitizen app (https://github.com/mentorchita/Geocit134) on AWS cloud. It requires preinstaled AWS CLI, Terraform and Terragrunt. This terraform code will deploy Application Load Balance with Autoscaling Group with EC2 (Ubuntu) instances and RDS (PostgreSQL DB) and 3 security groups for ALB, ASG and RDS.

## Prerequisites

1. Need to create an AWS AIM user with Admin previlages and access to CLI. 
2. Configure AWS CLI
3. Install Terraform + Terragrunt.

## Deployment
1. Clone repo
2. Optionaly change DB username/password
3. Change variables in providers.tf and terragrunt files terragrunt.hcl inside environments dir
4. Move to environments/{region} dir
5. run terragrunt plan/apply command
```
terragrunt run-all apply
```
