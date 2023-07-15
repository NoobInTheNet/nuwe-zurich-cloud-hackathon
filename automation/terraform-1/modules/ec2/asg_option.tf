# Uncomment the following lines, and comment the ones in the main.tf file, to use an Auto Scaling Group instead of individual EC2 instances.

/*
resource "aws_launch_configuration" "main" {
  name          = "${var.instance_name}_config"
  image_id      = var.ami
  instance_type = var.instance_type
  key_name      = var.key_name

  security_groups = [var.security_group_id]
}

resource "aws_autoscaling_group" "main" {
  launch_configuration = aws_launch_configuration.main.name
  min_size             = 2
  max_size             = 4
  desired_capacity     = 2
  vpc_zone_identifier  = [var.subnet_id]

  tag {
    key                 = "Name"
    value               = var.instance_name
    propagate_at_launch = true
  }
}
*/
