# 使用最精简的 Alpine
FROM alpine:latest

# 接收构建参数
ARG TARGETARCH
ARG NEZHA_VERSION

# 安装依赖 (gettext 提供 envsubst 命令用于渲染模板)
RUN apk add --no-cache ca-certificates wget unzip gettext

# 根据参数下载对应版本的二进制
RUN wget https://github.com/nezhahq/agent/releases/download/${NEZHA_VERSION}/nezha-agent_linux_${TARGETARCH}.zip -O agent.zip && \
    unzip agent.zip && \
    mv nezha-agent /usr/local/bin/nezha-agent && \
    rm agent.zip

# 复制配置文件模板和启动脚本
COPY config.yaml.tpl /app/config.yaml.tpl
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# 必须的环境变量
ENV NZ_SERVER=""
ENV NZ_CLIENT_SECRET=""
ENV NZ_UUID=""

# 启动脚本
ENTRYPOINT ["/entrypoint.sh"]