# tf-module-security-groups
Terraform module for creating a security group with dynamic rules.  
Useful when creating non-asg clusters of instances with shared resources across the stack - eg: git@github.com:sce81/tf-module-network-appliance.git


##### Usage

    module "public-sg" {
      source                                        = "git@github.com:sce81/tf-module-security-groups"
      env                                           = var.env
      project                                       = var.project
      name                                          = var.name
      vpc_id                                        = data.terraform_remote_state.infra.outputs.vpc_id
      sg_rules                                      = local.pub_sg_rules
      sg_name                                       = "public"            
    }

    locals {
        pub_sg_rules = [
            {
               source_sg          = null
               type               = "ingress"
               description        = "Internal HTTP"
               from_port          = 80
               to_port            = 80
               cidr_blocks        = "172.16.0.0/16"
               protocol           = "TCP"
            },
            {
               source_sg          = null
               type               = "egress"
               description        = "Outbound HTTP"
               from_port          = 80
               to_port            = 80
               cidr_blocks        = "0.0.0.0/0"
               protocol           = "TCP"
            },
        ]
    }