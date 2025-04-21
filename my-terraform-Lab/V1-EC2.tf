provider "aws" {
region  = "ap-south-1"
}

resource "aws_instance" "demo-server" {
    ami = "ami-0f1dcc636b69a6438"
    instance_type = "t2.micro"
    key_name = "dpp"
  
}