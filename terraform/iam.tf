data "aws_iam_policy_document" "jenkins_policy_doc" {
  statement {
    actions = [
      "s3:PutObject",
      "s3:PutObjectAcl",
      "s3:DeleteObject",
      "s3:ListBucket",
      "s3:GetObject"
    ]
    resources = [
      aws_s3_bucket.website_bucket.arn,
      "${aws_s3_bucket.website_bucket.arn}/*"
    ]
  }
  statement {
    actions = [
      "cloudfront:CreateInvalidation",
      "cloudfront:GetDistribution",
      "cloudfront:GetDistributionConfig"
    ]
    resources = ["*"]
  }
}

resource "aws_iam_policy" "jenkins_policy" {
  name   = "${var.project}-jenkins-deploy"
  policy = data.aws_iam_policy_document.jenkins_policy_doc.json
}
