#!/bin/bash
echo "Starting SSH key generation..."
if [ -z "$email" ]; then
    read -p "Please enter your email address: " email
fi
# Generate SSH key pair with empty passphrase
ssh-keygen -t rsa -b 4096 -C "$email" -N "" -f ~/.ssh/id_rsa

# Start the SSH agent and add the SSH private key
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/id_rsa

echo "SSH key generation and agent setup completed."
