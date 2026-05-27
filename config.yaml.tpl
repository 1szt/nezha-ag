# 核心连接变量 (通过环境变量替换)
server: ${NZ_SERVER}
client_secret: ${NZ_CLIENT_SECRET}
uuid: ${NZ_UUID}

# 基础配置
debug: false
tls: true
insecure_tls: false

# 功能开关
disable_auto_update: false
disable_command_execute: false
disable_force_update: false
disable_nat: false
disable_send_query: false
gpu: false
use_gitee_to_upgrade: false
use_ipv6_country_code: false
skip_connection_count: false
skip_procs_count: false
temperature: false

# 报告周期
ip_report_period: 1800
report_delay: 3
self_update_period: 0