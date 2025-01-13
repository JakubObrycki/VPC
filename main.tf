module "vpc" {
  source = "./modules/vpc"
  vpc_cidr = var.vpc_cidr
  public_subnet_cidr = var.public_subnet_cidr
}

module "sg" {
  source = "./modules/sg"
  vps_id = module.vpc.vps.id
}

module "ec2" {
  source = "./modules/ec2"
  sg_id = module.sg.sg_id
  subnet_id = module.vpc.subnet_ids
}

#wywala blad modulu ze wzgledu na brak bucketu na tym regionie !