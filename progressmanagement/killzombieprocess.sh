#!/bin/bash

# 杀死僵尸进程
kill -9 $(ps -A -ostat,ppid | grep -e '[zZ]'| awk '{ print $2 }')
