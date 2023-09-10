terraform {
  backend "s3" {
    bucket         = "tenzin-io"
    key            = "terraform/aws-tenzin-terraform.state"
    dynamodb_table = "tenzin-io"
    region         = "us-east-1"
  }
}

provider "aws" {
  region = "us-east-1"
}

resource "aws_ecrpublic_repository" "public" {
  for_each        = var.ecr_repositories
  repository_name = each.key
  catalog_data {
    about_text        = each.value.about_text
    description       = each.value.description
    architectures     = each.value.architectures
    operating_systems = each.value.operating_systems
    usage_text        = each.value.usage_text
  }
}
