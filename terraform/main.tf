# terraform {
#   backend "s3" {
#     bucket         = "project-terraform-s3-remote-backend"
#     key            = "terraform.tfstate"
#     region         = "us-east-1"
#     dynamodb_table = "terraform-state-lock"
#   }
# }

terraform {
  backend "local" {
    path = "./terraform.tfstate"
  }
}

module "namespaces" {
  source     = "./namespaces"
  namespaces = ["tools", "dev"]
}

module "nexus" {
  source = "./nexus"
}

module "jenkins" {
  source = "./jenkins"
}

