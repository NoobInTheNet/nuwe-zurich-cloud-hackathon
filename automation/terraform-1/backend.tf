terraform {
  backend "s3" {
    bucket         = "nuwe-zurich-cloud-hackathon-tf-states"
    key            = "nuwe-zurich-cloud-hackathon-final.tfstate"
    region         = "eu-west-3"
    dynamodb_table = "nuwe-zurich-cloud-hackathon-tf-state-lock"
    encrypt        = true
  }
}
