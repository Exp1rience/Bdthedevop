# Базовый образ PostgreSQL
FROM postgres:15

# Переменные окружения для создания базы и пользователя
ENV POSTGRES_USER=admin
ENV POSTGRES_PASSWORD=admin
ENV POSTGRES_DB=postgres

# Копируем дамп базы в специальную директорию,
# из которой PostgreSQL выполнит его при первом старте
COPY ./init.sql /docker-entrypoint-initdb.d/
