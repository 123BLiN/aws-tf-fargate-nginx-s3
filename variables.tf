variable "aws_region" {
  description = "The AWS region to create things in."
  default     = "us-west-2"
}

variable "aws_account_id" {
  description = "AWS account ID"

}

# AWS Fargate vars

variable "az_count" {
  description = "Number of AZs to cover in a given AWS region"
  default     = "2"
}

variable "app_image" {
  description = "Docker image to run in the ECS cluster"
  default     = "rrusakov/nginx-aws_auth-ldap:latest"
}

variable "app_port" {
  description = "Port exposed by the docker image to redirect traffic to"
  default     = 80
}

variable "app_count" {
  description = "Number of docker containers to run"
  default     = 3
}

variable "fargate_cpu" {
  description = "Fargate instance CPU units to provision (1 vCPU = 1024 CPU units)"
  default     = "256"
}

variable "fargate_memory" {
  description = "Fargate instance memory to provision (in MiB)"
  default     = "512"
}

# AWS S3 vars

variable "s3_bucket_name" {
  description = "The name of the bucket"
  type        = "string"
  default     = "test-s3-private-bucket-vpce-2"
}

variable "tags" {
  description = "A mapping of tags to assign to the bucket."
  default     = {
    Name        = "Nginx s3 test bucket"
    Environment = "Test"
  }
  type        = "map"
}