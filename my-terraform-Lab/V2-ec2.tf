provider "aws" {
region  = "ap-south-1"
}

resource "aws_security_group" "demo-sg" {
  name        = "demo-sg"
  description = "Allow TLS inbound traffic and all outbound traffic"


   ingress {
     description = "HTTPS"
     from_port   = 443
     to_port     = 443
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }

   ingress {
     description = "HTTP"
     from_port   = 80
     to_port     = 80
     protocol    = "tcp"
     cidr_blocks = ["0.0.0.0/0"]
   }


  ingress {
    description = "SSH access"
    protocol  = "tcp"
    from_port = 22
    to_port   = 22
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = { 
    name = "ssh-port"
  }
}

resource "aws_instance" "demo-server" {
    ami = "ami-062f0cc54dbfd8ef1"
    instance_type = "t2.micro"
    key_name = "dpp"
    security_groups = [ "demo-sg" ]


}
