import boto3
import os

s3 = boto3.client('s3')

def lambda_handler(event, context):
    # Retrieve the uploaded file data
    file_data = event['body']
    file_name = event['filename']
    bucket_name = os.environ['BUCKET_NAME']
    
    # Upload the file to S3
    s3.upload_fileobj(file_data, bucket_name, file_name)
    
    return {
        'statusCode': 200,
        'body': 'File uploaded successfully'
    }
