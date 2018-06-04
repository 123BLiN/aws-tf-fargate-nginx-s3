output "alb_hostname" {
  value = "${aws_alb.main.dns_name}"
}

# https://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/vpc-endpoints-s3.html
# Endpoints currently do not support cross-region requests—ensure that you create your 
# endpoint in the same region as your bucket. You can find the location of your bucket 
# by using the Amazon S3 console, or by using the get-bucket-location command. 
# Use a region-specific Amazon S3 endpoint to access your bucket; 
# for example, mybucket.s3-us-west-2.amazonaws.com.
output "s3_access_endpoint" {
  value = "${local.s3_access_endpoint}"
}

output "s3_external_object_url" {
  value = "${local.s3_external_object_url}"
}

output "s3_nginx_object_url" {
  value = "${local.s3_nginx_object_url}"
}