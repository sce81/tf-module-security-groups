data "aws_caller_identity" "current" {}
data "aws_region" "current" {}
locals {
    common_tags = {
        "Name"          = "${var.env}-${var.project}-${var.name}"
        "Porject"       = var.project
        "Environment"   = var.env
        "Terraform"     = "true"
    }
}
