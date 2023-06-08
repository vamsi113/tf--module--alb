resource "aws_lb" "internal" {
  name               = "${var.env}${var.name}-internal"
  internal           = true
  load_balancer_type = "application"
  security_groups    = [aws_security_group.internal_sg.id]
  subnets            = var.private_subnets

  tags = {
    name               = "${var.env}${var.name}-internal"
  }
}

resource "aws_security_group" "internal_sg" {
  name        = "${var.env}-${var.name}-internal-alb.sg"
  description = "${var.env}-${var.name}-internal-alb.sg"
  vpc_id      = var.vpc_id

  ingress {
    description = "HTTP"
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = [var.vpc_cidr]
  }



  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name = "${var.env}-${var.name}-internal-alb.sg"
  }
}