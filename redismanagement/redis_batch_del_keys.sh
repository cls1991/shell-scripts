#!/usr/bin/bash

# 批量删除redis键
redis-cli -p 6379 -n 0 keys "tb_player*" | xargs redis-cli -p 6379 -n 0 del
