resource "aws_security_group" "too_open" {
  name        = "open-sg"
  description = "Too open"
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 0
    to_port     = 65535
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group_rule" "bastion_ssh_access" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["102.220.173.58/32"]  # 👈 YOUR IP exactly
  security_group_id = aws_security_group.too_open.id  # or your bastion SG
}
