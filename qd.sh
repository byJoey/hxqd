#!/bin/bash

# 定义配置文件路径
CONFIG_FILE="$HOME/.hongxing_sign_config"
CRON_FILE="$HOME/.hongxing_cron_enabled"

# 从环境变量中获取邮箱和密码
email=${EMAIL:-""}
password=${PASSWORD:-""}

# 检查邮箱和密码是否为空
if [ -z "$email" ] || [ -z "$password" ]; then
    echo "邮箱或密码未设置，请通过环境变量 EMAIL 和 PASSWORD 提供。"
    exit 1
fi

# 定义签到接口
SIGN_URL="https://sign.hongxing.one/sign"

# 执行签到
response=$(curl -s -X POST -d "email=$email&password=$password" "$SIGN_URL")

# 解析并输出签到结果
status=$(echo "$response" | jq -r '.status')
time=$(echo "$response" | jq -r '.time')
message=$(echo "$response" | jq -r '.data.mag')
bytes=$(echo "$response" | jq -r '.data.bytes')
mb=$(echo "scale=2; $bytes / 1048576" | bc)

if [ "$status" -eq 200 ]; then
    echo "签到成功！"
    echo "时间戳: $time"
    echo "消息: $message"
    echo "获取流量: $mb MB"
else
    error_message=$(echo "$response" | jq -r '.message')
    echo "签到失败，原因: $error_message"
    echo "完整返回: $response"
fi
