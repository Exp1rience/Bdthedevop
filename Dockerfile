# Dockerfile
FROM postgres:16.4

# Копируем скрипт инициализации в нужную директорию
COPY db/init.sql /docker-entrypoint-initdb.d/

