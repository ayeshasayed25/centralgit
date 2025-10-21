output "s3_bucket" { value = aws_s3_bucket.website_bucket.id }
output "cloudfront_domain" { value = aws_cloudfront_distribution.cdn.domain_name }
output "cloudfront_distribution_id" { value = aws_cloudfront_distribution.cdn.id }
output "ec2_public_ip" { value = aws_instance.app.public_ip }
