#!/usr/bin/env bash
set -eu
credentials=($(aws sts get-session-token --duration "${1:-57600}" --query 'Credentials.[AccessKeyId, SecretAccessKey, SessionToken]' --output text))
echo export AWS_ACCESS_KEY_ID="${credentials[0]}" AWS_SECRET_ACCESS_KEY="${credentials[1]}" AWS_SECURITY_TOKEN="${credentials[2]}"
