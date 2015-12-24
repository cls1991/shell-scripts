#!/usr/bin/bash

# 删除非匹配文件(-v：反向选择, 亦即显示出没有'搜寻字符串'内容的那一行)
ls | grep -v -E '.jpg|.txt' | xargs rm
