#!/bin/bash
SECRET_ID=$1
PROJECT_ID=$2

SECRET_DATA=$(gcloud secrets versions access latest --secret="${SECRET_ID}" --project="${PROJECT_ID}")

# Escape double quotes and backslashes in SECRET_DATA
ESCAPED_SECRET_DATA=$(echo "$SECRET_DATA" | python3 -c 'import json, sys; print(json.dumps(sys.stdin.read()))')

# Output the secret data in JSON format
echo "{\"secret_data\": $ESCAPED_SECRET_DATA}"
