profile = "demo"
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

#rds
 allocated_storage    = 10
  db_name              = "csye6225"
  engine               = "mysql"
  engine_version       = "5.7"
  identifier           = "csye6225"
  instance_class       = "db.t3.micro"
  username             = "csye6225"
  password             = "PasswordTry!2022"
  storage_type         = "gp2"

  

  #bucket
  bucket_prefix = "csye6225-s3"
  storage_class = "STANDARD_IA"
  days= 30
  sse_algorithm = "AES256"

  #cidr_security_grp
  vpc_cidr_block_80 = ["0.0.0.0/0"]
  vpc_cidr_block_22 = ["0.0.0.0/0"]
 vpc_cidr_block_443 = ["0.0.0.0/0"]
 egress_cidr_1 = ["0.0.0.0/0"]
 egress_cidr_2 = ["0.0.0.0/0"]

 #route53
 record_name = "prod.namrataruchandani.me"
#  zone_id ="Z0723592RYST5MA9D4JZ"
    
