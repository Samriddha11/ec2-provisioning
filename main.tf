provider "aws" {
  region = var.region
}

resource "aws_instance" "ec2_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = var.subnet_id
  #key_name      = var.key_name

  tags = {
    Name         = var.name
    environment  = lower(var.environment)
    owner        = var.owner
    cost_centre  = var.cost_centre
  }
}
