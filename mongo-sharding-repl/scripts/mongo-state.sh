#!/bin/bash

for H in {"shard1r1","shard1r2","shard1r3","shard2r1","shard2r2","shard2r3"}; do
    docker compose exec -T $H mongosh --port 27018 --eval 'use somedb' --eval 'h = db.hello(); c = db.helloDoc.countDocuments(); print(h.me + " " + h.setName + " " + (h.isWritablePrimary ? "primary" : "secondary") + " " + c);'
done

