#!/bin/bash

echo "******** HOW TO ROTATE AWS KEYS *******"
echo ""
echo "$ aws iam create-access-key"
echo "NOTE: outputs JSON object with new credentials. Update .aws/env.sh and .aws/credentials"
echo ""
echo "$ aws iam list-access-keys"
echo "NOTE: Find oldest key for deletion"
echo ""
echo "$ aws iam delete-access-key --access-key-id KEY_ID/\$AWS_ACCESS_KEY_ID"
