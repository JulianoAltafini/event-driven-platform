#!/bin/bash

set -e

echo "Creating SQS queue..."
aws --endpoint-url=http://localhost:4566 sqs create-queue \
  --queue-name event-queue

echo "Creating S3 bucket..."
aws --endpoint-url=http://localhost:4566 s3 mb s3://event-bucket

echo "LocalStack resources created successfully"
