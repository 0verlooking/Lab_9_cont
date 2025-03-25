# Використовуйте базовий образ
FROM nginx:latest

# Копіюйте додаток у контейнер
COPY . /usr/share/nginx/html

# Вкажіть порт
EXPOSE 80
