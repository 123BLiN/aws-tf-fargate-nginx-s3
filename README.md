# Expose private AWS S3 bucket to the world and secure it with LDAP based authentication using nginx example

Example repository to deploy an ECS cluster hosting an nginx with the access to the private S3 bucket

Docker image used - https://hub.docker.com/r/rrusakov/nginx-aws_auth-ldap/

# TODO
- add AWS S3 private bucket
- add IAM role to the ECS tasks and grant it read only access to the private bucket
- add VPC endpoint to S3 bucket
- Refactor to use terraform modules
- Add some example LDAP provider to use it for authentication