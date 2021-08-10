

resource "aws_security_group" "main" {
  name                                      = "${var.env}-${var.project}-${var.name}-${var.sg_name}"
  description                               = "${var.env} ${var.project} ${var.name} ${var.sg_name} security group"
  vpc_id                                    = var.vpc_id


    tags = merge(
        local.common_tags, var.extra_tags,
        tomap({
            Name = "${var.env}-${var.project}-${var.name}-${var.sg_name}"
        })
    )

}

resource "aws_security_group_rule" "ingress" {
 count                                  = length(var.sg_rules)
 type                                   = var.sg_rules[count.index].type
 description                            = var.sg_rules[count.index].description
 from_port                              = var.sg_rules[count.index].from_port
 to_port                                = var.sg_rules[count.index].to_port
 protocol                               = var.sg_rules[count.index].protocol
 cidr_blocks                            = [var.sg_rules[count.index].cidr_blocks]
 source_security_group_id               = var.sg_rules[count.index].source_sg
 security_group_id                      = aws_security_group.main.id
}
