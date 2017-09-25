#!/bin/bash

# 查找phpmyadmin目录下包括"Welcome to "内容的php文件
find phpmyadmin -type f -regex ".*\.php" -exec grep "Welcome to " {} \; -print
# 统计多种类型的文件的个数
find src/ -type f -regex ".*\.h\|.*\.c" | wc -l
# 排除多个无关目录
# 第一种: -name参数匹配范围更广, 比如, './a', './other/a'等
# 第二种: 仅匹配列举出的目录
find . -type d \( -name a -o -name b \) -prune -o -print
find . -path './a' -prune -o -path './b' -prune -o -print
