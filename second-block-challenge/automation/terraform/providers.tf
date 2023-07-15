provider "aws" {
  region = var.region

  # Consult the README.md for more information on how to use the AssumeRole logic.
  /*   
  assume_role {
    role_arn = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
  }
  */
}
