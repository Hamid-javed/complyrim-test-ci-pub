provider "aws" { region = "us-east-1" }
resource "aws_s3_bucket" "data" {
  bucket = "acme-customer-data"
  acl    = "public-read"
}
resource "aws_security_group" "open" {
  name = "open-sg"
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_ebs_volume" "v" {
  availability_zone = "us-east-1a"
  size              = 10
  encrypted         = false
}
