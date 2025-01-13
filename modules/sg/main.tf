resource "aws_security_group" "sg" {
  name        = "sg"
  description = "Allow HTTP,SSH inbound traffic and all outbound traffic"
  vpc_id      = var.vps_id

  ingress {
    description = "HTTP"
    protocol  = "tcp"
    from_port = 80
    to_port   = 80
    cidr_blocks = ["0.0.0.0/0"]
  }

  ingress {
    description = "SSH"
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Securitygroup"
  }
}
