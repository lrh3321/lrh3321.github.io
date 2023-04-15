---
title: 为终端设置代理
slug: proxy-for-terminal
categories:
  - proxy
date: 2020-04-13 14:16:53+08:00
lastmod: 2022-06-18 14:16:53+08:00
tags:
  - proxy
  - git
---
# 为终端设置代理

## linux shell 终端代理设置方法

linux 要在 shell 终端为 `http` `https` `ftp` 协议设置代理，值需要设置对应的环境变量即可。

下面是一些关于代理的环境变量：

| 环境变量      | 描述                                                        | 值示例                                                         |
| ------------- | ----------------------------------------------------------- | -------------------------------------------------------------- |
| `http_proxy`  | 为http网站设置代理                                          | `10.0.0.51:8080`                                               |
|               |                                                             | `user:pass@10.0.0.10:8080`                                     |
|               |                                                             | `socks4://10.0.0.51:1080`                                      |
|               |                                                             | `socks5://192.168.1.1:1080`                                    |
| `https_proxy` | 为https网站设置代理                                         | 同上                                                           |
| `ftp_proxy`   | 为ftp协议设置代理                                           | `socks5://192.168.1.1:1080`                                    |
| `no_proxy`    | 无需代理的主机或域名，可以使用通配符，多个时使用 `,` 号分隔 | `*.aiezu.com,10.*.*.*,192.168.*.*,*.local,localhost,127.0.0.1` |

可以将上面4个环境变量设置项放于 `~/.bashrc` 文件尾部，这样用户打开bash shell终端时会自动调用此脚本，读入它们。

<!-- more -->

### bash http 站点设置代理

根据代理类型，将下面对应的设置项添加到 `~/.bashrc` 文件末尾，然后运行 `. ~/.bashrc` 命令使用之在当前环境生效。

```bash
# 为http站点设置http代理（默认）：
export http_proxy=10.0.0.52:8080
# 为http站点设置sock4、sock5代理：
# 设置 socks 代理，自动识别socks版本
export http_proxy=socks://10.0.0.52:1080
# 设置 socks4 代理
export http_proxy=socks4://10.0.0.52:1080
# 设置 socks5 代理
export http_proxy=socks5://10.0.0.52:1080
# 代理使用用户名密码认证：
export http_proxy=user:pass@192.158.8.8:8080
```

### bash https 站点设置代理

如果需要为https网站设置代理，设置`https_proxy`环境变量即可；设置方法完全与`http_proxy`环境变量相同：

```bash
# 任意使用一项
export https_proxy=10.0.0.52:8080
export https_proxy=user:pass@192.158.8.8:8080
export https_proxy=socks://10.0.0.52:1080
export https_proxy=socks4://10.0.0.52:1080
export https_proxy=socks5://10.0.0.52:1080
```

## 单独为 Git 启用代理

### HTTP 代理

```bash
# 全局
git config --global http.proxy http://127.0.0.1:1089
git config --global https.proxy http://127.0.0.1:1089
# 仓库
git config http.proxy http://127.0.0.1:1089
git config https.proxy http://127.0.0.1:1089
```

### Socks 5 代理

```bash
# 全局
git config --global http.proxy socks5://127.0.0.1:1088
git config --global https.proxy socks5://127.0.0.1:1088
# 仓库
git config http.proxy socks5://127.0.0.1:1088
git config https.proxy socks5://127.0.0.1:1088
```

### 取消代理

```bash
# 全局
git config --global --unset http.proxy
git config --global --unset https.proxy
# 仓库
git config --unset http.proxy
git config --unset https.proxy
```

----

## 参考链接

- [Linux bash终端设置代理（proxy）访问](https://aiezu.com/article/linux_bash_set_proxy)
