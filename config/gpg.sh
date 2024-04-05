#!/bin/bash

# 提示用户输入相关信息
read -p "请输入你的姓名: " name
read -p "请输入你的电子邮件地址: " email

# 生成 GPG 密钥对
gpg --batch --generate-key <<EOF
Key-Type: RSA
Key-Length: 2048
Name-Real: $name
Name-Email: $email
Expire-Date: 0
EOF

echo "GPG 密钥对已生成"