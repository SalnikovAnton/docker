FROM nginx

# Устанавливаем директорию и копируем в нее статические страницы
WORKDIR /usr/share/nginx/html
COPY index.html index.html
COPY about.html about.html

# Проброс портов 80 и 3000
EXPOSE 80 3000

# Добавляем два вольюма. Один для логов приложения, другой для web-страниц
VOLUME /var/log/nginx
VOLUME /usr/share/nginx/html

# Копируем файл конфигурации
COPY nginx.conf /etc/nginx/nginx.conf

# Старт Nginx в фоне
CMD ["nginx", "-g", "daemon off;"]
