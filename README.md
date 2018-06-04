# Expose private AWS S3 bucket to the world and secure it with LDAP based authentication using nginx example

Example repository to deploy an ECS cluster hosting an nginx with the access to the private S3 bucket.
Current version is using S3 bucket policy to allow only calls to the private S3 bucket from the concrete VPC endpoint (where Fargate tasks are running) but restricting all external calls from outside VPC.

Docker image used - https://hub.docker.com/r/rrusakov/nginx-aws_auth-ldap/

# TODO
- Create and attach IAM role to the fargate tasks
- Authenticate internal API calls to the S3 bucket by using AWS assume role inside the container and utilize AWS IAM attached to the container
- Add nginx configuration with aws_auth module and IAM role 
- Parametrize nginx configuration in docker container
- Refactor to use terraform modules
- Add some example LDAP provider to use it for authentication

# Known issues
- There possibly is some problem to assume role from the Fargate container https://forums.aws.amazon.com/thread.jspa?messageID=830807&tstart=0
- Signing keys have a validity of just one week. Hence, they need to be refreshed constantly - https://github.com/anomalizer/ngx_aws_auth#security-considerations so we need either some cron job inside the container with nginx SIGHUP or just replace containers regulary and generate new session keys every time during the startup script.  
- vpc endpoint is associated to the single route table - need to fix 