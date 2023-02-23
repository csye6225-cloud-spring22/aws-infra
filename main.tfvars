profile = "dev"
region  = "us-east-1"

# availabilityZones = [ "us-east-1a","us-east-1b","us-east-1c"]
vpc_tag              = "A03"
vpc_cidr_block       = "10.0.0.0/16"
internetgateway_cidr = "0.0.0.0/0"

subnet_public_cidr_zone1 = "10.0.1.0/24"
subnet_public_cidr_zone2 = "10.0.2.0/24"
subnet_public_cidr_zone3 = "10.0.3.0/24"

subnet_private_cidr_zone1 = "10.0.4.0/24"
subnet_private_cidr_zone2 = "10.0.5.0/24"
subnet_private_cidr_zone3 = "10.0.6.0/24"

owner_id     = ["460413207367"]
instanceType = "t2.micro"
volumeSize   = 50
volumeType   = "gp2"