#········[Provider's Variables]········#
variable "region" {
  description = "The region where to deploy the infrastructure."
  type        = string
  default     = "eu-west-3"
}
#--------[Provider's Variables]--------#

#········[Resources's Variables]········#
variable "stack_name" {
  description = "The custom name of the infrastructure stack to be deployed."
  type        = string
  default     = "zurich-cloud-hackathon"
}

variable "deployment_environment" {
  description = "The environment where the resources will be deployed to."
  type        = string
  default     = "dev"
}
#--------[Resources's Variables]--------#
