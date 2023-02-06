resource "aws_security_group_rule" "sg_rules_cidr" {
  for_each = local.sg_rules_cidr
  description = each.value["description"]
  type = each.value["direction"]
  protocol = each.value["protocol"]
  from_port = each.value["from_port"]
  to_port = each.value["to_port"]
  cidr_blocks = each.value["addresses"]["cidr_blocks"]
  security_group_id = aws_security_group.sec_group.id
}

resource "aws_security_group_rule" "sg_rules_sg" {
  for_each = local.sg_rules_sg
  description = each.value["description"]
  type = each.value["direction"]
  protocol = each.value["protocol"]
  from_port = each.value["from_port"]
  to_port = each.value["to_port"]
  cidr_blocks = each.value["addresses"]["cidr_blocks"]
  self = each.value["self"]
  source_security_group_id = element(each.value["addresses"]["source_security_group_id"],0)
  security_group_id = aws_security_group.sec_group.id
}