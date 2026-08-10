#!/bin/bash

###
# Инициализируем бд
###

docker compose exec -T mongos_router1 mongosh --port 27017 --eval 'use somedb' --eval 'for(var i = 0; i < 1000; i++) db.helloDoc.insertOne({age:i, name:"ly"+i})'

