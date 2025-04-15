terraform {
  required_version = ">= 1.3"
  backend "local" {}
}

provider "aws" {
  region = var.aws_region
}

module "network" {
  source = "./network"
  ec2_key_name  = var.ec2_key_name
}


module "iam" {
  source = "./iam"
}

module "eks" {
  source     = "./eks"
  vpc_id     = module.network.vpc_id
  subnet_ids = module.network.public_subnet_ids
}

provider "kubernetes" {
  host                   = module.eks.cluster_endpoint
  cluster_ca_certificate = base64decode(module.eks.cluster_certificate_authority_data)
  token                  = data.aws_eks_cluster_auth.this.token
}
