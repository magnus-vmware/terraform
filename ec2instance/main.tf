provider "aws" {
        region = "us-west-1"
}
  
resource "aws_instance" "MyApp" {
        ami ="ami-012f8fcc06515f35c"
        instance_type = "t2.micro"
        key_name = "CASkeyPair"
        security_groups= ["default"]
        tags = {
                Name        = var.instance_name
        }


  connection {
    type     = "ssh"
    user     = "centos"
    private_key = file("~/terraform/vm/CASkeyPair.pem")
    host     = self.public_ip
  }
}
