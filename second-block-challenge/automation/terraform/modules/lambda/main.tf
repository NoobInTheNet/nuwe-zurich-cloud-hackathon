# Create IAM role for Lambda
resource "aws_iam_role" "iam_for_lambda" {
  name = "iam_for_lambda"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "lambda.amazonaws.com"
        }
      },
    ]
  })
}

# Attach the AWSLambdaBasicExecutionRole policy to the role
resource "aws_iam_role_policy_attachment" "lambda_logs" {
  role       = aws_iam_role.iam_for_lambda.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

data "archive_file" "lambda_function_zip" {
  type        = "zip"
  source_dir  = "${path.module}/../../../../app/lambda"
  output_path = "${path.module}/lambda_function_payload.zip"
}

# Create a Lambda function
resource "aws_lambda_function" "function" {
  function_name    = "${var.stack_name}-lambda"
  filename         = data.archive_file.lambda_function_zip.output_path
  source_code_hash = filebase64sha256(data.archive_file.lambda_function_zip.output_path)
  role             = aws_iam_role.iam_for_lambda.arn
  handler          = "index.handler"
  runtime          = "python3.9"
}
