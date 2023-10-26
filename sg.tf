resource "aws_security_group" "ddon-sg" {
  description = "DDOn Security Group"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.MYIP]
    description = "Allow SSH from my IP"
  }
  egress {
    from_port  = 0
    to_port = 0
    protocol = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Allow All Trafic Outbound"
  }

  tags = {
    Name = "ddon-sg"
  }
}

resource "aws_security_group_rule" "game-server-rule" {
    from_port   = var.game-server-port
    to_port     = var.game-server-port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Game Server"
    type = "ingress"
    security_group_id = aws_security_group.ddon-sg.id
}

resource "aws_security_group_rule" "web-server-rule" {
    from_port   = var.web-server-port
    to_port     = var.web-server-port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Web Server"
    type = "ingress"
    security_group_id = aws_security_group.ddon-sg.id
}

resource "aws_security_group_rule" "login-server-rule" {
    from_port   = var.login-server-port
    to_port     = var.login-server-port
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Game Server"
    type = "ingress"
    security_group_id = aws_security_group.ddon-sg.id
}