---
title: 使用 aria2 搭建离线下载服务器
description: Welcome to Hugo Theme Stack
slug: aria2-download-server
categories:
  - aria2
date: 2020-02-21 23:33:09
lastmod: 2022-06-16 23:33:09
toc: true
tags:
  - aria2
  - systemd
  - nginx
---

# 使用 aria2 搭建离线下载服务器

在VPS主机上安装 aria2 下载软件用作离线下载，能够远程管理下载，下载完成后能够通过HTTP（或其他任何你愿意的方式）从VPS取回。

<!-- more -->

## 安装

### Ubuntu/Debian 系统

```bash
sudo apt update
sudo apt-get install -y aria2
```

### 其他操作系统

可以访问[Aria2 官网](https://aria2.github.io/)获取下载、安装信息。

## 配置&启动

aria2 最简单的运行方式是 `aria2c <download-url-path>`，即会从给出的url下载文件。但我们希望它能记住一些设置，常驻后台运行。aria2 启动时会首先尝试从`$HOME/.aria2/aria2.conf`读取配置文件。此外，可以在启动时加入`--conf-path`参数手动指定配置文件位置，也可以通过`--no-conf`强制不读取配置文件。

### 创建配置文件

```bash
mkdir -p ~/.aria2
mkdir -p ~/Downloads          # 下载文件保存目录
touch ~/.aria2/aria2.conf     # 创建配置文件
touch ~/.aria2/aria2.session  # 会话文件，若开启session会用到
```

使用编辑器编辑配置文件

```ini
##### RPC Options #####

# 开启JSON-RPC/XML-RPC服务，从而能够通过其接口控制aria2，默认为true
enable-rpc=true
# 指定访问端口号，默认6800
rpc-listen-port=6800
# 允许所有访问来源，web控制界面跨域需要，默认false
rpc-allow-origin-all=true
# 允许除local loopback以外的网卡访问，默认false，远程控制需要
rpc-listen-all=true
# 外部访问安全令牌，强烈建议设置token并记住
rpc-secret=123456
# 若不设置token，也可通过用户名密码访问，现版本不建议使用
# rpc-user=<username>
# rpc-passwd=<passwd>

##### Advance Options #####

# 以守护进程方式后台运行，默认为false，也可在启动aria2c时加上-D选项达到相同效果
daemon=true
# 磁盘缓存，可设为0禁用，默认16M。
disk-cache=16M
# 磁盘空间分配模式，可选none，prealloc，trunc，falloc，默认prealloc
# 若完整分配，官方建议ext4、NTFS使用falloc快速分配，可以瞬间完成分配
# FAT32、ext3建议使用prealloc，如果此时使用falloc分配时间和prealloc相当，分配时会造成aria2卡顿
file-allocation=falloc

# 使用会话文件保存信息，并能够从意外错误（断电等）错误中恢复
save-session=~/.aria2/aria2.session
# 指定开启时读取会话文件的位置
input-file=~/.aria2/aria2.session
# 定期保存会话，默认0为只在退出时保存
save-session-interval=60

##### Basic Options #####

# 下载路径
dir=~/Downloads
# 最大同时下载任务数量，默认为5
max-concurrent-downloads=20
# 若下载速度低于此值（Byte/s），会被自动暂停，速度可以有K或M等后缀，对BT下载无效
#lowest-speed-limit=0
# 每个下载任务对单个服务器最大的链接数量，默认为1
max-connection-per-server=10
# 任务分块大小，当下载文件大小大于两倍于此设置时，会被分块下载，默认20M
min-split-size=20M
# 任务分块数量，默认为5
split=10
# 可以通过伪装方式进行PT下载，参考下列设置，但请谨慎尝试
# DHT（若torrent禁用，即使设置为true也不会启用）
# enable-dht=false
# enable-dht6=false
# 本地查找（若torrent禁用，即使设置为true也不会启用）
# bt-enable-lpd=false
# 本地peer交换（若torrent禁用，即使设置为true也不会启用）
# enable-peer-exchange=false
# 客户端伪装
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
```

## 配置开机自启动

### 使用 Systemd 配置为 Service

```bash
# 创建 service 文件
tee ~/.aria2/aria2.service <<EOF
[Unit]
Description=Aria2 Service
After=network.target
Wants=network.target
[Install]
WantedBy=multi-user.target

[Service]
# 使用当前用户运行程序
User=$USER
Group=$USER
Type=simple
PIDFile=/run/aria2.pid
ExecStart=/usr/bin/aria2c --conf-path $HOME/.aria2/aria2.conf
Restart=on-failure
EOF

# 加入 Systemd
sudo ln -s ${HOME}/.aria2/aria2.service /lib/systemd/system/
# 重新加载 unit 文件
sudo systemctl daemon-reload
# 开启开机自启，并启用服务
sudo systemctl enable --now aria2
```

## 添加 Web 管理界面

这里以 [AriaNG](http://ariang.mayswind.net/zh_Hans/) 为例

### 通过 AriaNG 管理 Aria2

AriaNG 其官网如下：

[http://ariang.mayswind.net/zh_Hans/](http://ariang.mayswind.net/zh_Hans/)

Release 发布地址：

[https://github.com/mayswind/AriaNg/releases](https://github.com/mayswind/AriaNg/releases)

最新每日构建：

[https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip](https://github.com/mayswind/AriaNg-DailyBuild/archive/master.zip)

### 安装 Nginx

```bash
sudo apt install nignx
```

### 下载 AriaNg

```bash
# 下载，可以修改需要的版本
version=${version:-"1.3.4"}
wget https://github.com/mayswind/AriaNg/releases/download/${version}/AriaNg-${version}.zip -O /tmp/AriaNg.zip

# 创建前端文件保存目录
sudo mkdir -p /var/www/html/airang
sudo chown -R ${USER}:${USER} /var/www/html/airang
rm -rf /var/www/html/airang/*
pushd /var/www/html/airang
# 解压文件
sudo unzip /tmp/AriaNg.zip
popd
```

### 创建 Nginx 站点

#### 添加用户密码登录

可选步骤

```bash
# 指定用户名，这里为 admin
user=${user:-"admin"}
sudo mkdir -p /var/www/auth
sudo htpasswd -c -d /var/www/auth/nginx_auth ${user}
```

#### 创建为默认站点

```bash
port=${port:-"80"}
sudo tee /etc/nginx/sites-enabled/default <<EOF
map \$http_upgrade \$connection_upgrade {
    default upgrade;
    '' close;
}
server {
    listen ${port} default_server;
    listen [::]:${port} default_server;

    # 可设置域名
    server_name _;

    root /var/www/html/airang;
    index index.html;

    # 注释以下两行可取消用户密码登录
    auth_basic "Authrization";
    auth_basic_user_file /var/www/auth/nginx_auth;

    # 为 aria2 JSON-RPC 配置反向代理，可选。
    # 配置后可以少对外开放一个端口
    location /jsonrpc {
        proxy_pass http://127.0.0.1:6800;
        # 反代 WebSocket 协议
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "Upgrade";
    }

    # 配置 HTTP 文件服务，用于取回文件
    location /downloads {
        alias ${HOME}/Downloads;
        # 防止乱码
        charset utf-8;        
        autoindex on;
        autoindex_exact_size on;
        autoindex_localtime on;
    }
}
EOF

# 查看配置是否正确
sudo nginx -t
# 让 Nginx 重新加载配置
sudo nginx -s reload
```

在浏览器中打开站点，查看效果。

**出现认证失败的情况**

在 Web 界面 > AriaNg 设置 > RPC 中配置 Aria2 RPC 密钥。即 aria2 配置文件中的 `rpc-secret`

## 配置文件取回功能

我们希望 aria2 下载好文件后，我们能够通过浏览器访问下载目录，并能下载文件。可以搭建 HTTP 或 FTP 服务来实现这一功能。通常 HTTP 和 FTP 搭建的文件服务，可以使用下载工具，一些服务软件（如 nginx ）还可以支持多线程下载、断点续传。

## All in One

```bash
#!/bin/bash

port=${port:-"9100"}
version=${version:-"1.1.6"}
USER=${user:-"admin"}
password=${user:-"123456"}


apt update
apt install -y aria2

mkdir -p ~/.aria2
mkdir -p ~/Downloads          # 下载文件保存目录
touch ~/.aria2/aria2.conf     # 创建配置文件
touch ~/.aria2/aria2.session  # 会话文件，若开启session会用到

tee ~/.aria2/aria2.conf <<EOF
##### RPC Options #####

# 开启JSON-RPC/XML-RPC服务，从而能够通过其接口控制 aria2, 默认为 true
enable-rpc=true
# 指定访问端口号，默认6800
rpc-listen-port=6800
# 允许所有访问来源，web控制界面跨域需要，默认false
rpc-allow-origin-all=true
# 允许除local loopback以外的网卡访问，默认false，远程控制需要
rpc-listen-all=true
# 外部访问安全令牌，强烈建议设置token并记住
rpc-secret=123456
# 若不设置token，也可通过用户名密码访问，现版本不建议使用
# rpc-user=<username>
# rpc-passwd=<passwd>

##### Advance Options #####

# 以守护进程方式后台运行，默认为false，也可在启动aria2c时加上-D选项达到相同效果
daemon=true
# 磁盘缓存，可设为0禁用，默认16M。
disk-cache=16M
# 磁盘空间分配模式，可选none，prealloc，trunc，falloc，默认prealloc
# 若完整分配，官方建议ext4、NTFS使用falloc快速分配，可以瞬间完成分配
# FAT32、ext3建议使用prealloc，如果此时使用falloc分配时间和prealloc相当，分配时会造成aria2卡顿
file-allocation=falloc

# 使用会话文件保存信息，并能够从意外错误（断电等）错误中恢复
save-session=${HOME}/.aria2/aria2.session
# 指定开启时读取会话文件的位置
input-file=${HOME}/.aria2/aria2.session
# 定期保存会话，默认0为只在退出时保存
save-session-interval=60

##### Basic Options #####

# 下载路径
dir=${HOME}/Downloads
# 最大同时下载任务数量，默认为5
max-concurrent-downloads=20
# 若下载速度低于此值（Byte/s），会被自动暂停，速度可以有K或M等后缀，对BT下载无效
#lowest-speed-limit=0
# 每个下载任务对单个服务器最大的链接数量，默认为1
max-connection-per-server=10
# 任务分块大小，当下载文件大小大于两倍于此设置时，会被分块下载，默认20M
min-split-size=20M
# 任务分块数量，默认为5
split=10
# 可以通过伪装方式进行PT下载，参考下列设置，但请谨慎尝试
# DHT（若torrent禁用，即使设置为true也不会启用）
# enable-dht=false
# enable-dht6=false
# 本地查找（若torrent禁用，即使设置为true也不会启用）
# bt-enable-lpd=false
# 本地peer交换（若torrent禁用，即使设置为true也不会启用）
# enable-peer-exchange=false
# 客户端伪装
peer-id-prefix=-TR2770-
user-agent=Transmission/2.77
EOF


# 创建 service 文件
tee ~/.aria2/aria2.service <<EOF
[Unit]
Description=Aria2 Service
After=network.target
Wants=network.target
[Install]
WantedBy=multi-user.target

[Service]
# 使用当前用户运行程序
User=$USER
Group=$USER
Type=simple
PIDFile=/run/aria2.pid
ExecStart=/usr/bin/aria2c --conf-path $HOME/.aria2/aria2.conf
Restart=on-failure
EOF

# 关闭守护进程选项
sed -i s/daemon=true/daemon=false/ /root/.aria2/aria2.conf

# 加入 Systemd
ln -s ${HOME}/.aria2/aria2.service /lib/systemd/system/
# 重新加载 unit 文件
systemctl daemon-reload
# 开启开机自启，并启用服务
systemctl enable --now aria2

apt-get install -y nginx wget apache2-utils

mkdir -p /var/www/auth
htpasswd -b -c -d /var/www/auth/nginx_auth ${user} ${password}

# 下载，可以修改需要的版本
wget https://github.com/mayswind/AriaNg/releases/download/${version}/AriaNg-${version}.zip -O /tmp/AriaNg.zip

# 创建前端文件保存目录
mkdir -p /var/www/html/airang
chown -R ${USER}:${USER} /var/www/html/airang
rm -rf /var/www/html/airang/*
pushd /var/www/html/airang
# 解压文件
unzip /tmp/AriaNg.zip
popd

ln -s ${HOME}/Downloads/ /var/www/html/downloads
chown www-data:www-data /var/www/html/downloads

tee /etc/nginx/conf.d/aria2.conf <<EOF
map \$http_upgrade \$connection_upgrade {
    default upgrade;
    '' close;
}
server {
    listen ${port} default_server;
    listen [::]:${port} default_server;

    # 可设置域名
    server_name _;

    root /var/www/html/airang;
    index index.html;

    # 注释以下两行可取消用户密码登录
    auth_basic "Authrization";
    auth_basic_user_file /var/www/auth/nginx_auth;

    # 为 aria2 JSON-RPC 配置反向代理，可选。
    # 配置后可以少对外开放一个端口
    location /jsonrpc {
        proxy_pass http://127.0.0.1:6800;
        # 反代 WebSocket 协议
        proxy_http_version 1.1;
        proxy_set_header Upgrade \$http_upgrade;
        proxy_set_header Connection "Upgrade";
    }

    # 配置 HTTP 文件服务，用于取回文件
    location /downloads {
        alias /var/www/html/downloads/;
        # 防止乱码
        charset utf-8;        
        autoindex on;
        autoindex_exact_size on;
        autoindex_localtime on;
    }
}
EOF

```
