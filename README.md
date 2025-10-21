# E-commerce DevOps Project - Hijab Shop (Ready-to-run)

This repository provides a ready-to-run skeleton for a static e-commerce website
deployed with a Terraform-managed AWS infra and a Jenkins pipeline that syncs
the site to S3 and invalidates CloudFront.

**Contents**
- `website/` - static front-end (HTML/CSS/JS)
- `terraform/` - Terraform code to create S3, CloudFront (OAI), EC2 (optional), IAM policy, CloudWatch alarms
- `jenkins/` - `Jenkinsfile` pipeline example
- `scripts/` - helper scripts for local workflow
- `README.md` - this file

**Quick start (developer / demo)**
1. Install Terraform (v1.5+ recommended) and AWS CLI.
2. Configure your AWS credentials locally (e.g. `aws configure` or environment variables).
3. Edit `terraform/terraform.tfvars` with your preferred values (region, project, environment).
4. Initialize and apply Terraform:
   ```bash
   cd terraform
   terraform init
   terraform apply -auto-approve
   ```
5. Note outputs: `s3_bucket`, `cloudfront_domain`, `cloudfront_distribution_id`.
6. Create a Jenkins job (or run locally) that runs the provided `jenkins/Jenkinsfile`:
   - Create Jenkins AWS credentials (Access Key ID / Secret) and set credentialsId to `aws-creds`.
   - In the job, define two environment variables:
     - `PROJECT_S3_BUCKET` = terraform output `s3_bucket`
     - `CLOUDFRONT_DISTRIBUTION_ID` = terraform output `cloudfront_distribution_id`
7. Push this repo to your Git server and run the Jenkins pipeline, or run the deploy script locally:
   ```bash
   ./scripts/deploy_to_s3.sh <S3_BUCKET_NAME>
   ```

**Security & notes**
- `force_destroy = true` on the S3 bucket is included for convenience in dev only. Remove for production.
- The CloudFront distribution uses the default CloudFront certificate. For a custom domain, add ACM certificate and update `viewer_certificate` and `aliases` in Terraform.
- This repo does not include AWS access keys — create an IAM user with the minimal policy in `terraform/jenkins_policy.json` and store keys securely in Jenkins credentials.

**Files included**
- `website/index.html`, `website/css/style.css`, `website/js/app.js`
- `terraform/main.tf`, `variables.tf`, `outputs.tf`, `iam.tf`, `cloudwatch.tf`, `terraform.tfvars`
- `jenkins/Jenkinsfile`
- `scripts/deploy_to_s3.sh` (helper)

---
Ready? Download the zip and extract locally:
[Download the ZIP](sandbox:/mnt/data/ecommerce-devops.zip)
