---
title: 设置 npm 镜像源
categories:
  - node
date: 2020-06-19 21:52:43+08:00
lastmod: 2022-06-19 21:52:43+08:00
tags:
  - npm
  - mirrors
---

# NodeJS 使用阿里镜像仓库

```bash
npm config set registry https://registry.npmmirror.com/

npm config set disturl https://npmmirror.com/mirrors/node/
npm config set sass_binary_site https://npmmirror.com/mirrors/node-sass/
npm config set sharp_dist_base_url https://npmmirror.com/mirrors/sharp-libvips/
npm config set electron_mirror https://npmmirror.com/mirrors/electron/
npm config set puppeteer_download_host https://npmmirror.com/mirrors/
npm config set phantomjs_cdnurl https://npmmirror.com/mirrors/phantomjs/
npm config set sentrycli_cdnurl https://npmmirror.com/mirrors/sentry-cli/
npm config set sqlite3_binary_site https://npmmirror.com/mirrors/sqlite3/
npm config set python_mirror https://npmmirror.com/mirrors/python/
```

<!-- more -->

```bash
yarn config set registry https://registry.npmmirror.com/
```
