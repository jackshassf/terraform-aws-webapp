output "vpcid"{
  value = aws_vpc.main.id
}

output "pubnet1_id"{
  value = aws_subnet.main-public-1.id
}

