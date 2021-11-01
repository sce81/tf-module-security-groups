variable "sg_rules" {
  description = "map of security group configuration for attaching security group rules to the security group"
  type = list(object({
    source_sg   = optional(string)
    type        = optional(string)
    description = optional(string)
    from_port   = optional(string)
    to_port     = optional(string)
    cidr_blocks = optional(string)
    protocol    = optional(string)
  }))
  default = [null]
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