variable "ami" {
  description = "The AMI to use for the instance"
  type        = string
  default     = "ami-0f61de2873e29e866"
}

variable "instance_type" {
  description = "The type of instance to start"
  type        = string
  default   = "t2.micro"
}

variable "key_name_1" {
  description = "The key name to use for the first instance"
  type        = string
}

variable "key_name_2" {
  description = "The key name to use for the second instance"
  type        = string
}

variable "subnet_id" {
  description = "The ID of the subnet to associate with the instance"
  type        = string
}

variable "security_group_id" {
  description = "The ID of the security group to associate with the instance"
  type        = string
}

variable "instance_name" {
  description = "The base name to assign to the instances"
  type        = string
}
