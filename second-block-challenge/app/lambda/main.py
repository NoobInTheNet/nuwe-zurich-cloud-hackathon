import os
import boto3

s3 = boto3.client("s3")


def lambda_handler(event, context):
    # Retrieve the uploaded image from the event
    image_data = event["body"]

    # Generate a unique filename for the image
    image_filename = f"image_{context.aws_request_id}.jpg"

    try:
        # Save the image to the S3 bucket
        s3.put_object(
            Body=image_data,
            Bucket=os.environ["BucketName"],
            Key=image_filename,
        )

        # Return a success response
        response = {"statusCode": 200, "body": "Image uploaded successfully"}
    except Exception as e:
        # Return an error response
        response = {"statusCode": 500, "body": f"Error uploading image: {str(e)}"}

    return response
