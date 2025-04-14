terraform {
  required_version = ">= 1.3"
  backend "local" {}
}

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
  source     = "./eks"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
}
