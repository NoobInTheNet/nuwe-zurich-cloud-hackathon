output "instance_id_1" {
  description = "The ID of the first instance"
  value       = aws_instance.main[0].id
}

output "instance_id_2" {
  description = "The ID of the second instance"
  value       = aws_instance.main[1].id
}
