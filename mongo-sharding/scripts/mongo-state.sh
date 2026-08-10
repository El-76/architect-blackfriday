#!/bin/bash

for H in {"shard1","shard2"}; do
    docker compose exec -T $H mongosh --port 27018 --eval 'use somedb' --eval 'h = db.hello(); c = db.helloDoc.countDocuments(); print(h.me + " " + h.setName + " " + (h.isWritablePrimary ? "primary" : "secondary") + " " + c);'
done

