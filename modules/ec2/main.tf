data "aws_ami" "amazon-2" {
  most_recent = true

  filter {
    name = "name"
    values = ["amzn2-ami-hvm-*-x86_64-ebs"]
  }
  owners = ["amazon"]
}

resource "aws_instance" "My_EC2" {
  ami           = data.aws_ami.amazon-2.id
  instance_type = "t2.micro"
  vpc_security_group_ids = [var.sg_id]
  subnet_id = var.subnet_id
  tags = {
    Name = "My_EC2"
  }
}