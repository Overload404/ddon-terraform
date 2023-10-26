variable "region" {
  default = "eu-central-1"
}

variable "zone1" {
  default = "eu-central-1a"
}

variable "zone2" {
  default = "eu-central-2a"
}

variable "zone3" {
  default = "eu-central-3a"
}

variable "user" {
  default = "ubuntu"
}

variable "MYIP" {
  default = "0.0.0.0/0" // replace '0.0.0.0/0' with '<your IP>/32' if you have a static IP
}
variable "game-server-port" {
  default = "52000"
}

variable "web-server-port" {
  default = "52099"
}

variable "login-server-port" {
  default = "52100"
}