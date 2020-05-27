#!/usr/bin/env bash
# set -euo pipefail

aws ssm start-session \
	--target "$1" \
	--region "$2" \
	--document-name AWS-StartPortForwardingSession \
	--parameters "{\"portNumber\":[\"$3\"],\"localPortNumber\":[\"$3\"]}"
