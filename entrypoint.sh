#!/bin/sh
set -e

# 验证必需的环境变量
if [ -z "$NZ_SERVER" ] || [ -z "$NZ_CLIENT_SECRET" ] || [ -z "$NZ_UUID" ]; then
    echo "错误: 必须设置 NZ_SERVER, NZ_CLIENT_SECRET, NZ_UUID 环境变量"
    exit 1
fi

# 配置文件不存在时才生成
if [ ! -f /etc/nezha/config.yaml ]; then
    mkdir -p /etc/nezha
    envsubst < /app/config.yaml.tpl > /etc/nezha/config.yaml
fi

# 启动探针
exec /usr/local/bin/nezha-agent -c /etc/nezha/config.yaml