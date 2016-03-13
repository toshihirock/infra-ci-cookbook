provider "aws" {
  region = "${var.region}"
}

resource "aws_instance" "web" {
  ami = "${var.ami}"
  instance_type = "t2.micro"
  subnet_id = "${var.subnet_id}"
  associate_public_ip_address = true
  vpc_security_group_ids = ["${var.sg_id}"]
  key_name = "${var.key_name}"

  provisioner "local-exec" {
    command = "echo ${aws_instance.web.public_ip} ${aws_instance.web.public_dns} >> /tmp/hosts.txt"
  }
}
