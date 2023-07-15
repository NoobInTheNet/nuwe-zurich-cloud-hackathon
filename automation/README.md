# 🚀 NUWE Zurich Cloud Hackathon: Terraform Project for Block 1

Welcome to the Terraform project for Block 1 of NUWE's Zurich Cloud Hackathon! This repository is your one-stop-shop for creating a two-node EC2 infrastructure on AWS. Each node is unique, boasting its own key pair, and they coexist harmoniously within the same VPC and subnet.

## 📚 Project Structure

Our project is neatly organized as follows:

- `main.tf`: The main entry point for our Terraform project. It's like the conductor of an orchestra, calling upon local modules to create the resources.
- `backend.tf`: This file is our backstage manager, configuring the backend for storing the Terraform state. We're using an S3 bucket for this purpose.
- `outputs.tf`: This file is our show-and-tell, defining the outputs for the Terraform project. These outputs provide useful information about the resources that are created.
- `providers.tf`: This file is our AWS provider configurator for Terraform.
- `variables.tf`: This file is our customization hub, defining the variables for the Terraform project. These variables allow you to customize the resources that are created.
- `versions.tf`: This file is our quality control, specifying the required versions of Terraform and the AWS provider.
- `modules/`: This directory is our resource factory, containing the local modules for the different resources. Each module includes its own `main.tf`, `variables.tf`, and `outputs.tf` file.

## 🧠 Decisions and Rationale

### Individual EC2 Instances vs Auto Scaling Group

We initially toyed with the idea of using an Auto Scaling Group (ASG) for the EC2 instances. An ASG would provide automatic scaling based on load, and it would ensure that the desired number of instances are always running.

However, the requirement was to use a different key pair for each instance. In an ASG, all instances typically share the same key pair because they're created from the same launch configuration. Therefore, we decided to use individual EC2 instances instead of an ASG to comply with this requirement.

If you want to switch to an ASG in the future, you can replace the `aws_instance` resources in the EC2 module with an `aws_launch_configuration` and an `aws_autoscaling_group`. However, you would need to manage access at the operating system level, as all instances in the ASG would share the same key pair. An example has been left under the `asg_option.tf` filename in the `terraform/modules/ec2` module.

### Amazon Linux 2023 AMI

We chose to use the Amazon Linux 2023 AMI for the EC2 instances. This is a general-purpose AMI that AWS provides and maintains. It's suitable for a wide range of workloads, and it comes with many AWS-specific tools and enhancements.

The AMI ID is specified as a variable, so you can easily change it if you want to use a different AMI.

### Security Group Configuration

The security group allows SSH access and opens the specific ports that the services will use. We restricted the source IP addresses for the SSH ingress rules to reduce the exposure to potential attacks. The CIDR blocks for SSH access are specified as a variable, so you can easily change them.

## 🔐 Authentication

We recommend using AWS Identity and Access Management (IAM) roles for authenticating Terraform with AWS. If you're running Terraform on an EC2 instance, you can attach an IAM role to the instance with the necessary permissions. If you're running Terraform locally, you can use the `assume_role` block in the AWS provider configuration.

```hcl
provider "aws" {
  region = "us-west-2"
  assume_role {
    role_arn = "arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME"
  }
}
```

Get short-term credentials with the AWS CLI:

```sh
aws sts assume-role --role-arn arn:aws:iam::ACCOUNT_ID:role/ROLE_NAME --role-session-name SESSION_NAME
export AWS_ACCESS_KEY_ID=ACCESS_KEY_ID_FROM_ABOVE
export AWS_SECRET_ACCESS_KEY=SECRET_ACCESS_KEY_FROM_ABOVE
export AWS_SESSION_TOKEN=SESSION_TOKEN_FROM_ABOVE
```

As a fallback, use environment variables to provide AWS credentials.

```sh
export AWS_ACCESS_KEY_ID=your_access_key
export AWS_SECRET_ACCESS_KEY=your_secret_key
export AWS_SESSION_TOKEN=your_session_token  # Optional
```

\*Remember to replace placeholders like `ACCOUNT_ID`, `ROLE_NAME`, `ACCESS_KEY_ID_FROM_ABOVE`, `SECRET_ACCESS_KEY_FROM_ABOVE`, `SESSION_TOKEN_FROM_ABOVE`, `your_access_key`, `your_secret_key`, and `your_session_token` with your actual values.

## 🏃‍♂️ Usage

To use this Terraform project, you need to have Terraform and the AWS CLI installed. You also need to have an AWS account and the necessary permissions to create the resources.

1. Clone this repository:

```bash
git clone git@gitlab.com:NoobInTheNet/nuwe-zurich-cloud-hackathon.git
cd nuwe-zurich-cloud-hackathon/automation/terraform/
```

2. Initialize Terraform:

```bash
terraform init
```

3. Create a plan:

```bash
terraform plan -out=tfplan
```

4. Apply the plan:

```bash
terraform apply tfplan
```

## 🐳 Docker Deployment with Nuwe

We've also included a customized version of the Docker setup provided by Nuwe for deployment. Here's how to use it:

1. Build and deploy the Docker Compose definition:

```bash
docker compose up --build -d
```

- Please note that we've removed the LocalStack deployment as we're using AWS directly.
- Also, we detected that Gogs UI wasn't working because of port 10080, which was being the one mapped externally for the web UI access, and is usually blocked by browsers to avoid [NAT Slipstreaming](https://www.vandis.com/insights/nat-slipstream-what-it-is-and-how-to-protect-your-organization/) attacks.
- And the first login on Gogs, we created the admin user through the CLI tool.
