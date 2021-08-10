variable "sg_rules" {
  description = "map of security group configuration for attaching security group rules to the security group"
  type = list(object({
    source_sg   = string
    type        = string
    description = string
    from_port   = string
    to_port     = string
    cidr_blocks = string
    protocol    = string
  }))
  default = []
}
variable "name"    {}
variable "env"  {}
variable "project"  {}
variable "vpc_id"   {}
variable "sg_name" {default = "main"}
variable "extra_tags" {
    type = map
    default = {}
}