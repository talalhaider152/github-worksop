#!/bin/bash

# Use git-secrets to check for secrets
git secrets --scan
if [ $? -ne 0 ]; then
    echo "Secrets or API keys found in the files. Push aborted!"
    exit 1
fi

echo "Pre-push checks passed."
