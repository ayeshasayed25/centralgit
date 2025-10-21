#!/usr/bin/env bash
# Simple helper to upload website/ to S3 from local machine.
# Usage: ./scripts/deploy_to_s3.sh <bucket-name>
set -euo pipefail
if [ "$#" -ne 1 ]; then
  echo "Usage: $0 <s3-bucket-name>"
  exit 1
fi
BUCKET="$1"
aws s3 sync website/ "s3://$BUCKET/" --delete
echo "Uploaded to s3://$BUCKET/"
