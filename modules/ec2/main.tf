resource "aws_instance" "ec2" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
        Name = var.ec2_name
    }
   vpc_security_group_ids = ["${aws_security_group.ec2-security-group.id}"]
   subnet_id = var.subnet_id
}

resource "aws_security_group" "ec2-security-group" {
    name = "security-group-terraform"
    vpc_id = var.vpc_id
    ingress {
        from_port = 22
        to_port = 22
        protocol = "tcp"
        cidr_blocks = ["0.0.0.0/0"]

    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

    tags = {
        Name = "ec2-security-group"

    }

}