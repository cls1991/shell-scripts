#!/usr/bin/bash

# 校验本地下载的文件, 避免重复下载
wget --no-clobber -i gank.txt
