provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./network"
}

module "iam" {
  source = "./iam"
}

module "eks" {
  source = "./eks"
  vpc_id = module.network.vpc_id
}
