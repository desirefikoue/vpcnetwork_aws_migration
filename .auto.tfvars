region = "us-east-1"
environment = "Development"
vpc_cidr = "10.0.0.0/16"      # 65536 private ip addresses    #200 subnets 
public_subnet_1_cidr  = "10.0.1.0/16"   #/20  4096 ip addresses   # /24  = 256 ip addresses      /32  = 1 ip address 
public_subnet_2_cidr  = "10.0.2.0/16"
private_subnet_1_cidr = "10.0.10.0/16"
private_subnet_2_cidr = "10.0.12.0/16"