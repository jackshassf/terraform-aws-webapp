variable "cidr"{
  description = "The cidr_block for the VPC"
  type        = string
}

variable "cidr_pub_subnet"{
  description = "The cidr_block for the public subnet"
  type        = string
}

variable "az"{
  description = "The availability zone name"
  type        = string
}
