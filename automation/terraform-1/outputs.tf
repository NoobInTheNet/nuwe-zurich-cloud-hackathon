output "instance_id_1" {
  description = "The ID of the first instance"
  value       = module.ec2.instance_id_1
}

output "instance_id_2" {
  description = "The ID of the second instance"
  value       = module.ec2.instance_id_2
}
