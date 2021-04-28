provider "aws" {
  region = var.AWS_REGION
}

module "vpc"{
  source          = "./vpc"
  cidr            = var.cidr
  cidr_pub_subnet = var.cidr_pub_subnet
  az              = var.az
}

module "webserver"{
  source = "./webserver"

  vpcid         = module.vpc.vpcid
  pubnet1_id    = module.vpc.pubnet1_id

  AWS_REGION    = var.AWS_REGION
  AMIS          = var.AMIS
  type          = var.ec2_type 
  autoscale_min = var.autoscale_min
  autoscale_max = var.autoscale_max
}

output "ELB_DNS_Name" {
  value = module.webserver.elb_dns_name
}

