#!/bin/bash

# 查找phpmyadmin目录下包括"Welcome to "内容的php文件
find phpmyadmin -type f -regex ".*\.php" -exec grep "Welcome to " {} \; -print
