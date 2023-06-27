FROM nginx

# Создаем директорию и копируем в нее созданные страницы
WORKDIR /usr/share/nginx/html
COPY index1.html index1.html
COPY index2.html index2.html

# Добавляем два вольюма. Один для логов приложения, другой для web-страниц
VOLUME /var/log/nginx
VOLUME /usr/share/nginx/html

# Копируем файл конфигурации
COPY nginx.conf /etc/nginx/nginx.conf

# Проброс портов 80 и 3000
EXPOSE 80 3000

# Стартуем Nginx
CMD ["nginx", "-g", "daemon off;"]
