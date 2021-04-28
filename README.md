# Simple Webserver Infrastructure Deployment with Terraform

The Terraform script will launch the following services in AWS, to serve a web page with “Hello World” in it:

-	A VPC 
-	A load balancer
-	An EC2 instance from a Linux AMI 

The default setting uses t2.micro EC2 instance type which is covered by AWS free tier. Running it won't cost you extra money but remember to always destroy it.

Tested on: 
- Ubuntu: Terraform v0.12.18 + provider.aws v3.37.0
- Mac   : Terraform v0.14.10 + provider registry.terraform.io/hashicorp/aws v3.37.0


## USAGE

If to run it on your local machine, run 'aws configure' cmd first to make sure the proper AWS access is configured. 
Or run it on a AWS VM which already has roles set up for access to create the AWS resources needed.

Run the following steps to launch the AWS resources:
```
$ terraform init
$ terraform plan
$ terraform apply
```

After execution completed you'll see the result summary as shown below. Copy the ELB_DNS_Name value to a browser to verify the "Hello World" website run successfully. (Sometimes you need to wait for another ~30 seconds for all AWS resources to be fully initialized.)
```
Apply complete! Resources: 10 added, 0 changed, 0 destroyed.

Outputs:

ELB_DNS_Name = <a DNS name in the format of elb_name.region_name.elb.amazonaws.com>
```

After the verification completed, remember to run the following step to destroy the resources to avoid cost:
```
$ terraform destroy
```

## TODO and Security Enhancements
- This script demoed how to develop Terraform Modules, 'vpc' and 'webservers'. For production quality, the [Terraform AWS Modules](https://registry.terraform.io/namespaces/terraform-aws-modules) should be used where possible like vpc module, security group module, etc. Only develop private modules when logically needed.
- Because a load balancer already in place, the EC2 instance can be moved to private subnets as a security enhancement. Adding NAT gateways and update the security group accordingly.
- Use ALB or Network Load Balancer for benefits that can not be provided by the classic load balancer.
- Use HTTPS(443) instead of HTTP(80) as a security enhancement. 
- The autoscaling policy should link to a CloudWatch alert to manage the scaling up/down automatically.
- A key pair should be added to enable SSH to the EC2 instance. If moving the instance to private subnets, consider to add a jump box for SSH access to the EC2 instance. Then the security group can be updated accordingly to be SSHed from the jump box only. 
- The self-developed module currently only supports one availability zone. For production quality, multiple AZs should be supported while scaling up the instance numbers.

