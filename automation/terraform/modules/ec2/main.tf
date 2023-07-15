resource "aws_instance" "main" {
  count         = 2
  ami           = var.ami
  instance_type = var.instance_type
  key_name      = count.index == 0 ? var.key_name_1 : var.key_name_2
  subnet_id     = var.subnet_id

  vpc_security_group_ids = [var.security_group_id]

  tags = {
    Name = "${var.instance_name}-${count.index}"
  }
}
