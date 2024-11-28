# -------------------------------------------
# Common Variables
# -------------------------------------------

variable "global" {
  description = "global config"
  type        = map(string)
  default = {
    "region"       = "us-east-1"
    "project"      = "project-name"
    "workloadname" = "workloadname"
    "desc"         = "desc"
    "createdby"    = "system"
    "orgunit"      = "OU001"
    "businessunit" = "BU001"
    "costcenter"   = "CC001"
    "environment"  = "dev"
    "owner"        = "owner@domain.com"
    supportcentre  = "support@domain.com"
  }
}


variable "aws_region" {
  description = "AWS infrastructure"
  type        = string
  default     = "us-east-1"
  validation {
    condition = anytrue([
      var.aws_region == "us-east-1",
      var.aws_region == "us-east-2"
    ])
    error_message = "Invalid AWS Region. Region must be US EAST 1 or US EAST 2"
  }
}



variable "env" {
  description = "Which environment the resource is deployed"
  type        = string
  default     = "dev"
  validation {
    condition = anytrue([
      var.env == "dev",
      var.env == "stg",
      var.env == "prod"
    ])
    error_message = "Invalid environment. Environment must be dev/stg/prod"
  }
}



# -------------------------------------------
# EC2
# -------------------------------------------
variable "ami" {
  description = "ami"
  type        = string
  default     = null
}

variable "instance_type" {
  description = "instance_type"
  type        = string
  default     = "t2.micro"
}

variable "associate_public_ip_address" {
  description = "associate_public_ip_address"
  type        = bool
  default     = true
}

variable "subnet_id" {
  description = "subnet_id"
  type        = string
  default     = null
}

variable "availability_zone" {
  description = "availability_zone"
  type        = string
  default     = null
}

variable "vpc_security_group_ids" {
  description = "vpc_security_group_ids"
  type        = list(string)
  default     = []
}