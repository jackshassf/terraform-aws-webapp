variable "AWS_REGION" {
  default = "ap-southeast-2"
}

variable "az" {
  default = "ap-southeast-2a"
}

variable "cidr" {
  default = "10.0.0.0/16"
}

variable "cidr_pub_subnet" {
  default = "10.0.1.0/24"
}

variable "AMIS" {
  type = map(string)
  default = {
    ap-southeast-2 = "ami-0bd9d6d8b2b837023"
    us-east-1 = "ami-13be557e"
    us-west-2 = "ami-06b94666"
  }
}

variable "ec2_type" {
  default = "t2.micro"
}

variable "autoscale_min" {
  default = 1
}

variable "autoscale_max" {
  default = 1
}
