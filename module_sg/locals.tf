locals {
  sg_rules_cidr = {
    for rule in keys(var.sg_rules):
      rule => lookup(var.sg_rules, rule) if lookup(var.sg_rules, rule)["addresses"]["type"] == "cidr_blocks"
  }
  sg_rules_sg = {
    for rule in keys(var.sg_rules):
      rule => lookup(var.sg_rules, rule) if lookup(var.sg_rules, rule)["addresses"]["type"] == "source_security_group_id"
  }
}
