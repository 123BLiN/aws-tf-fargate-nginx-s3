# Expose private AWS S3 bucket to the world and secure it with LDAP based authentication using nginx example

Example repository to deploy an ECS cluster hosting an nginx with the access to the private S3 bucket.
Current version is using S3 bucket policy to allow only calls to the private S3 bucket from the concrete VPC endpoint (where Fargate tasks are running) but restricting all external calls from outside VPC.

Docker image used - https://hub.docker.com/r/rrusakov/nginx-aws_auth-ldap/

# How to use
- `terrafrom plan`
- `terrafrom apply`
- check terrafrom run output

Example output:
```
Apply complete! Resources: 0 added, 0 changed, 0 destroyed.

Outputs:

alb_hostname = tf-ecs-chat-xxxxxx.us-west-2.elb.amazonaws.com
s3_access_endpoint = test-s3-private-bucket-vpce-2.s3-us-west-2.amazonaws.com
s3_external_object_url = https://s3.us-west-2.amazonaws.com/yyyyyyy/secret_file.txt
s3_nginx_object_url = http://tf-ecs-chat-xxxxxx.us-west-2.elb.amazonaws.com/s3/secret_file.txt
```
where
`s3_external_object_url` - external URL to the secret s3 object - is not accessible from the world
`s3_nginx_object_url` - url to the object hosted with nginx - is accessible from the outside

# TODO
- Add autoscaling group
- Add nginx basic auth as an example
- Create and attach IAM role to the fargate tasks
- Authenticate internal API calls to the S3 bucket by using AWS assume role inside the container and utilize AWS IAM attached to the container
- Restrict s3 bucket access to the VPC endpoint only plus console access
- Add nginx configuration with aws_auth module and IAM role 
- Parametrize nginx virtualhost configuration in docker container with envsubst
- Refactor to use terraform modules
- Add some example LDAP provider to use it for authentication

# Known issues
- There possibly is some problem to assume role from the Fargate container https://forums.aws.amazon.com/thread.jspa?messageID=830807&tstart=0
- Signing keys have a validity of just one week. Hence, they need to be refreshed constantly - https://github.com/anomalizer/ngx_aws_auth#security-considerations so we need either some cron job inside the container with nginx SIGHUP or just replace containers regulary and generate new session keys every time during the startup script.