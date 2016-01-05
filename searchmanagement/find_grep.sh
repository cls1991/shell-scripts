#!/bin/bash

# 查找phpmyadmin目录下包括"Welcome to "内容的php文件
find phpmyadmin -type f -regex ".*\.php" -exec grep "Welcome to " {} \; -print
# 统计多种类型的文件的个数
find src/ -type f -regex ".*\.h\|.*\.c" | wc -l
