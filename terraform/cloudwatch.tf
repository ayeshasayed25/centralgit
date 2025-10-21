resource "aws_cloudwatch_metric_alarm" "ec2_cpu_high" {
  alarm_name          = "${var.project}-ec2-cpu-high"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods  = 2
  metric_name         = "CPUUtilization"
  namespace           = "AWS/EC2"
  period              = 300
  statistic           = "Average"
  threshold           = 80
  dimensions = {
    InstanceId = aws_instance.app.id
  }
  actions_enabled = true
}

resource "aws_cloudwatch_metric_alarm" "cf_5xx" {
  alarm_name = "${var.project}-cloudfront-5xx"
  comparison_operator = "GreaterThanThreshold"
  evaluation_periods = 1
  metric_name = "5xxErrorRate"
  namespace   = "AWS/CloudFront"
  period      = 300
  statistic   = "Average"
  threshold   = 0.01
  dimensions = {
    DistributionId = aws_cloudfront_distribution.cdn.id
    Region         = "Global"
  }
}
