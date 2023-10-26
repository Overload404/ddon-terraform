resource "aws_key_pair" "ddon-key" {
  key_name   = "ddon-key"
  public_key = file("ddon_key.pub")
}

resource "aws_spot_instance_request" "ddon-server" {
  spot_type         = "one-time"
  ami               = "ami-06dd92ecc74fdfb36"
  spot_price        = "0.02"
  instance_type     = "t2.medium"
  availability_zone = var.zone1
  key_name          = aws_key_pair.ddon-key.key_name
  security_groups = [aws_security_group.ddon-sg.name]
  wait_for_fulfillment = true

  provisioner "file" {
    source      = "ddon.sh"
    destination = "/tmp/ddon.sh"
  }

  provisioner "remote-exec" {
    inline = ["sudo chmod u+x /tmp/ddon.sh",
      "sudo /tmp/ddon.sh"
    ]

  }

  connection {
    host        = self.public_ip
    private_key = file("ddon_key")
    user        = var.user
  }

  tags = {
    Name = "ddon-server"
  }
}

output "public_ip" {
  value = aws_spot_instance_request.ddon-server.public_ip
}