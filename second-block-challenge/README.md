## Application and Infrastructure Documentation

### Objective

The objective of this project is to deploy an application that allows users to upload images through a static HTML webpage and store them in an S3 bucket. The application consists of a serverless architecture using AWS services.

### Infrastructure Overview

The infrastructure for this application is deployed using Terraform, which provides infrastructure as code capabilities. It automates the provisioning and management of AWS resources, ensuring consistency and repeatability.

#### S3 Bucket

- **Problem solved:** The S3 bucket serves as a storage solution for the uploaded images. It provides durability, scalability, and high availability for the stored objects.

- **Efficiency comparison:** Using S3 as the storage solution is highly efficient. It provides low latency for read and write operations and is designed for high throughput. S3 automatically scales to handle the workload, ensuring optimal performance even during peak usage.

- **Cost optimization:** S3 offers cost optimization through its pay-as-you-go pricing model. You only pay for the storage used and the data transfer. Additionally, S3 provides features like lifecycle policies and storage classes (such as Standard, Intelligent-Tiering, and Glacier) to further optimize costs based on data access patterns and retention requirements.

#### Lambda Function

- **Problem solved:** The Lambda function handles the image upload process. It receives the uploaded image and saves it to the S3 bucket.

- **Efficiency comparison:** Using Lambda functions for this task is efficient as they provide on-demand compute resources and automatically scale to handle incoming requests. This eliminates the need to manage and provision servers, allowing for seamless scalability. Lambda functions are also event-driven, meaning they execute only when triggered, reducing idle time and optimizing resource utilization.

- **Cost optimization:** Lambda functions follow a pay-per-use model, where you are charged only for the time the function is executing. This ensures cost optimization by avoiding the need to maintain and pay for idle resources. Additionally, Lambda integrates well with S3, allowing you to optimize costs further by leveraging S3 event notifications to trigger the function only when needed.

#### API Gateway

- **Problem solved:** The API Gateway acts as an HTTP endpoint for the HTML webpage to communicate with the Lambda function. It allows the webpage to trigger the Lambda function when an image is uploaded.

- **Efficiency comparison:** API Gateway provides an efficient way to expose the Lambda function as an HTTP endpoint. It handles request routing, security, and throttling, ensuring efficient communication between the webpage and Lambda function. It also provides features like caching and response transformations to enhance performance.

- **Cost optimization:** API Gateway offers a tiered pricing model, where you pay based on the number of requests and data transfer. It allows cost optimization by scaling according to the traffic and only charging for actual usage. Additionally, API Gateway integrates seamlessly with Lambda, allowing for optimized performance and reduced costs by eliminating the need for a separate server infrastructure.

#### Terraform

- **Problem solved:** Terraform is used to automate the provisioning and management of the application's infrastructure. It ensures consistent and repeatable deployments, reducing manual configuration and human errors.

- **Efficiency comparison:** Terraform's declarative syntax and infrastructure as code approach provide efficient infrastructure management. It allows for version control, collaboration, and easy scaling of resources. Terraform's state management also enables accurate tracking of deployed resources and facilitates changes and updates to the infrastructure.

- **Cost optimization:** Terraform allows for infrastructure as code, which means infrastructure can be treated as software. This enables cost optimization through code review, automation, and version-controlled changes. Terraform's plan functionality provides insights into the impact of infrastructure changes before deployment, allowing for cost considerations and optimizations.

### Conclusion

The application and infrastructure have been designed to solve the problem of image uploads and storage efficiently and cost-effectively. The chosen AWS services, S3 bucket, Lambda function, and API Gateway, provide scalability, reliability, and optimal performance. They offer pay-as-you-go pricing, ensuring cost optimization by charging only for the resources used.

By using Terraform to provision and manage the infrastructure, the deployment process becomes automated, repeatable, and manageable as code. This allows for easy maintenance, version control, and scaling of the application, ensuring consistency and reliability.

🚀 Happy image uploading! 📷
