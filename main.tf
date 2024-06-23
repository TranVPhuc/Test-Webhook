provider "aws" {
  region = "ap-southeast-1"  
}

resource "aws_instance" "example" {
  ami           = "ami-0bcedba63d7253ea7"  
  instance_type = "t2.micro"

  tags = {
    Name = "TerraformExample"
  }
}
