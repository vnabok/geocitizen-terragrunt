include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../../module_sg"
}

inputs = {
    sg_name = "rds_pgsql"
    vpc_id = "vpc-id"
    sg_rules = {
        rule01 = {
            description = "PostgreSQL ingress"
            direction = "ingress"
            protocol = "TCP"
            from_port = 5432
            to_port = 5432
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["172.31.0.0/16"]
            }
        },
        # rule02 = {
        #     description = "PostgreSQL ingress SG"
        #     direction = "ingress"
        #     protocol = "TCP"
        #     from_port = 5432
        #     to_port = 5432
        #     addresses = {
        #     type = "source_security_group_id"
        #     source_security_group_id = ["sg-089396c12b8be4053"]
        #     }
        # },
        rule03 = {
            description = "Allow egress"
            direction = "egress"
            protocol = "-1"
            from_port = 0
            to_port = 0
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        }
    }
}
