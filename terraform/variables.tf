variable "aws_region" { description = "AWS region" default = "us-east-1" }
variable "project" { description = "Project name" default = "hijab-shop" }
variable "environment" { description = "Environment" default = "dev" }
variable "public_key_path" { description = "Path to SSH public key for EC2 access" default = "~/.ssh/id_rsa.pub" }
