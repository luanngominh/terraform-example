provider "aws" {
	access_key = var.access_key
	secret_key = var.secret_key
	region 	  = var.region
}

resource "aws_instance" "example" {
	ami	= "ami-0dad20bd1b9c8c004"
	instance_type = "t2.micro"
	tags = {
		Name = "example"
	}

	depends_on = [aws_s3_bucket.example]

	provisioner "local-exec" {
		command = "echo example ${aws_instance.example.public_ip} > ip"
	}
}

resource "aws_eip" "ip" {
  instance = aws_instance.example.id
  tags = {
    Name = "eip-example"
  }
}

resource "aws_s3_bucket" "example" {
	acl = "private"
	bucket = "terraform-getting-started-bucket-090"
}

