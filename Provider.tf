provider "aws" {
  region     = "eu-west-2"
  profile    = "terraform"
}
resource "aws_instance" "linux-os" {
  ami           = "ami-06dc09bb8854cbde3"
  instance_type = "t2.micro"
  key_name      = "TerraformKP"
  security_groups = ["sgtf for SSH"]
  tags = {
    Name = "HelloTerraform"
  }

}
resource "null_resource" "null" {
 connection {
     type       = "ssh"
     user       = "ec2-user"
     private_key = file("C:/Users/RASHNI/Downloads/TerraformKP.pem")
     host        = aws_instance.linux-os.public_ip
  }
}
 

