#!/bin/bash

# Запускаем систему
docker-compose up -d

# Проверяем здоровье сервисов
docker-compose ps --services --filter=health=unhealthy | grep .
if [ $? == 0 ]; then
  echo "Health check failed! Похоже, откат при падении хелсчека никто не прописал..."
fi
