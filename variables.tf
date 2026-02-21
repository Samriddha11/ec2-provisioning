variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "subnet_id" {
  description = "Subnet ID"
  type        = string
}

variable "key_name" {
  description = "Key pair name"
  type        = string
  default     = null
}

# Mandatory Tags

variable "name" {
  description = "Name tag for EC2 instance"
  type        = string

  validation {
    condition     = length(var.name) > 0
    error_message = "Name tag must not be empty."
  }
}

variable "environment" {
  description = "Environment (dev, qa, prod)"
  type        = string

  validation {
    condition     = contains(["dev", "qa", "prod"], lower(var.environment))
    error_message = "Environment must be one of: dev, qa, prod."
  }
}

variable "owner" {
  description = "Owner of the resource"
  type        = string

  validation {
    condition     = length(var.owner) > 2
    error_message = "Owner must be provided."
  }
}

variable "cost_centre" {
  description = "Cost Centre for billing"
  type        = string

  validation {
    condition     = length(var.cost_centre) > 0
    error_message = "Cost Centre must be provided."
  }
}
