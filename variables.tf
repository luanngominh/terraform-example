variable "access_key" {}
variable "secret_key" {}
variable "region" {
	default = "ap-southeast-1"
}

variable "cidrs" {
	default = []
}

variable "amis" {
	type = "map"
	default = {
		"ap-southeast-1": "ami-0dad20bd1b9c8c004"
		"us-east-2": "ami-04768381bf606e2b3"
	}
}
