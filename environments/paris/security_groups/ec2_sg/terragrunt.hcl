include {
    path = find_in_parent_folders()
}

terraform {
    source = "../../../../module_sg"
}

inputs = {
    sg_name = "ec2"
    vpc_id = "vpc-029acbc3d0d7865e2"
    sg_rules = {
        rule01 = {
            description = "HTTP ingress"
            direction = "ingress"
            protocol = "TCP"
            from_port = 80
            to_port = 80
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        },
        rule02 = {
            description = "HTTPS ingress"
            direction = "ingress"
            protocol = "TCP"
            from_port = 443
            to_port = 443
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        },
        rule03 = {
            description = "8080 ingress"
            direction = "ingress"
            protocol = "TCP"
            from_port = 8080
            to_port = 8080
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        },
        rule04 = {
            description = "SSH ingress"
            direction = "ingress"
            protocol = "TCP"
            from_port = 22
            to_port = 22
            addresses = {
            type = "cidr_blocks"
            cidr_blocks = ["0.0.0.0/0"]
            }
        },
        rule05 = {
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