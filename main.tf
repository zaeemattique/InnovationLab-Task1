module "vpc" {
    source    = "./modules/vpc"
    vpc_cidr  = var.vpc_cidr
}

module "subnet" {
    source = "./modules/subnets"
    vpc_id = module.vpc.vpc_id
    subnetA_cidr = var.subnetA_cidr
    subnetB_cidr = var.subnetB_cidr
    AZA = var.AZA
    AZB = var.AZB
  
}

module "security_groups" {
    source = "./modules/security_groups"
    vpc_id = module.vpc.vpc_id
    

}

module "ec2" {
    source           = "./modules/ec2"
    ec2_ami         = var.ec2_ami
    ec2_instance_type = var.ec2_instance_type
    subnetA_id      = module.subnet.subnetA_id
    subnetB_id      = module.subnet.subnetB_id
    sgA_id          = module.security_groups.sgA_id
    sgB_id          = module.security_groups.sgB_id
    AZA = var.AZA
    AZB = var.AZB
}

module "igw" {
    source = "./modules/igw"
    vpc_id = module.vpc.vpc_id
}

module "route_table" {
    source = "./modules/route_table"
    vpc_id = module.vpc.vpc_id
    igw_id = module.igw.igw_id
    subnetA_id = module.subnet.subnetA_id
    subnetB_id = module.subnet.subnetB_id
}

terraform {
  backend "s3" {
    bucket = "task1-zaeem-tfstate"
    key    = "task1/terraform/state/terraform.tfstate"
    region = "us-west-2"
    
    dynamodb_table = "task1-zaeem-tfstate-lock"
  }
}