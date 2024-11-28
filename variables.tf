# -------------------------------------------
# Common Variables
# -------------------------------------------

variable "global" {
  description = "global config"
  type        = map(any)
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

variable "tags" {
  description = "global config"
  type        = map(any)
}

# variable "aws_region" {
#   description = "AWS infrastructure"
#   type        = string
#   default = "us-east-1"
#   validation {
#     condition = anytrue([
#       var.aws_region == "us-east-1",
#       var.aws_region == "us-east-2"
#     ])
#     error_message = "Invalid AWS Region. Region must be US EAST 1 or US EAST 2"
#   }
# }


# -------------------------------------------
# Common Variables or Tags
# -------------------------------------------

variable "project" {
  description = "Project name"
  type        = string
  default     = "demo1"
  validation {
    condition     = length(var.project) > 4
    error_message = "The project value must be a valid user in organization."
  }
}

variable "workloadname" {
  description = "Workload name"
  default     = "demo0"
  type        = string
  validation {
    condition     = length(var.workloadname) > 4
    error_message = "The workloadname value must be a valid workload in organization."
  }
}


variable "createdby" {
  description = "The username who executed the TF project"
  type        = string
  default     = "system"
  validation {
    condition     = length(var.createdby) > 4
    error_message = "The createdby value must be a valid user in organization."
  }
}

variable "owner" {
  description = "The owner who owns the resources"
  type        = string
  default     = "owner@domain.com"
  validation {
    condition     = length(var.owner) > 4
    error_message = "The owner value must be a valid user in organization."
  }
}

variable "org_unit" {
  description = "he organizational unit of the resource. such as IT, Marketing, Finance. Depends on how is your org hierarchy is defined"
  type        = string
  default     = "DEMO"
  validation {
    condition = anytrue([
      var.org_unit == "DEMO",
      var.org_unit == "DEMO1"
    ])
    error_message = "Invalid org_unit. Org unit must be DEMO or DEMO1"
  }
}



variable "business_unit" {
  description = "Business unit"
  type        = string
  default     = "DEMO"
  validation {
    condition     = length(var.business_unit) > 2
    error_message = "The business_unit value must be a valid Business Unit in organization."
  }
}

variable "cost_center" {
  description = "Cost center for billing"
  type        = string
  default     = "CC-001"
  validation {
    condition     = length(var.cost_center) > 5 && substr(var.cost_center, 0, 3) == "CC-"
    error_message = "The cost_center value must be a valid Cost center id, starting with \"CC-\"."
  }
}

variable "contact_support" {
  description = "Support team contact"
  type        = string
  default     = "contact@domain.com"
  validation {
    condition     = length(var.contact_support) > 4
    error_message = "Support team contact"
  }
}


variable "desc" {
  description = "Short description of the application/project"
  type        = string
  default     = "Description unavailable"
}

variable "tier" {
  description = "Which tier the resource/application belongs Web/App/DB"
  type        = string
  default     = "app"
  validation {
    condition = anytrue([
      var.tier == "web",
      var.tier == "app",
      var.tier == "db"
    ])
    error_message = "Invalid tire. Must be web/app/db"
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
  description = "(Optional) Whether to associate a public IP address with an instance in a VPC."
  type        = bool
  default     = false
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

variable "user_data_filepath" {
  description = "(Optional) User data to provide when launching the instance"
  type        = string
  default     = null
}

variable "key_name" {
  description = "key_name"
  type        = string
  default     = null
}

variable "iam_instance_profile" {
  description = "iam_instance_profile"
  type        = string
  default     = null
}

variable "disable_api_termination" {
  description = " (Optional) If true, enables EC2 Instance Termination Protection"
  type        = bool
  default     = true
}