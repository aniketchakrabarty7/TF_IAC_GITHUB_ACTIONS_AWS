provider "aws" {
    region = var.webserver_region
}

resource "aws_security_group" "Webserver_SG" {
    name = "Webserver_SG"
    description = "Security Group fro webserver instances"

    ingress {
        from_port = 80
        protocol = "TCP"
        to_port = 80
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 22
        protocol = "TCP"
        to_port = 22
        cidr_blocks = ["0.0.0.0/0"]
    }    
}

resource "aws_instance" "Webserver_Instance" {
    instance_type = var.instance_type
    ami = var.webserver_ami
    tags = {
        name = "Webserver_Instance"
    }
    security_groups = ["${aws_security_group.Webserver_SG.name}"]
    user_data = file("./cloud_init.cfg")
}
