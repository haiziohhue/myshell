#!/bin/bash

# 生成 GPG 密钥对
gpg --batch --generate-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: $name
Name-Email: $email
Expire-Date: 0
EOF

echo "GPG generated successfully."