#!/usr/bin/env bash
API='http://localhost:4000/createAccount'

# Define the installation routine for this module
echo "Installing Pigeon Network"
ACCOUNT=$(curl -s '$API?email=gg@gg.com&password=abc123' | jq . )

echo $ACCOUNT
