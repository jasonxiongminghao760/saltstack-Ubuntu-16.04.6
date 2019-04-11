#!/usr/bin/env bash
# 创建mongo的root用户
if mongo admin --eval "db.createUser({user:'root', pwd:'123456', roles:['root']})"; then
    echo "changed=false comment='Grant root to mongo-server sucessful.'"
    exit 0
else
    echo "changed=false comment='Grant root to mongo-server faild.'"
    exit 1
fi
