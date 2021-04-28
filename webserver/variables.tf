variable "vpcid" {
  description = "The VPC id to be referenced"
  type        = string
}

variable "pubnet1_id"{
  description = "The public network ID"
  type        = string
}

variable "AWS_REGION"{
  description = "The AWS region used to deploy the application"
  type        = string
}

variable "AMIS"{
  description = "The AWS AMI IDs from each region"
  type        = map(string)
}

variable "type"{
  description = "The type of the EC2 instance"
  type        = string
}

variable "autoscale_min"{
  description = "Min instance number in auto scalling"
  type        = number
}

variable "autoscale_max"{
  description = "Max instance number in auto scalling"
  type        = number
}
