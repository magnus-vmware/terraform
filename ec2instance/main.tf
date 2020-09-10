provider "aws" {
        access_key = var.access_key
        secret_key = var.secret_key
        region = "us-west-1"
}
  
resource "aws_instance" "MyApp" {
        ami ="ami-012f8fcc06515f35c"
        instance_type = "t2.micro"
        key_name = "CASkeyPair"
        security_groups= ["default"]

  connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("~/terraform/vm/CASkeyPair.pem")
    host     = self.public_ip
  }
}
