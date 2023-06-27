# Docker
### 1) Написать Dockerfile на базе apache/nginx который будет содержать две статичные web-страницы на разных портах. Например, 80 и 3000.:
### 2) Пробросить эти порты на хост машину. Обе страницы должны быть доступны по адресам localhost:80 и localhost:3000.
### 3) Добавить 2 вольюма. Один для логов приложения, другой для web-страниц


* необходима машина с установленным Docker;
   
Создаем папку и переходим в нее   
```
mkdir ./docker
cd ./docker

```
Создаем необходимые файлы, такие как  [Dockerfile](https://github.com/SalnikovAnton/docker/blob/main/Dockerfile "Dockerfile"), две статичные web-страницы [index1.html](https://github.com/SalnikovAnton/docker/blob/main/index1.html "index1.html"), [index2.html](https://github.com/SalnikovAnton/docker/blob/main/index2.html "index2.html") и файл конфигурации [nginx.conf](https://github.com/SalnikovAnton/docker/blob/main/nginx.conf "nginx.conf")
   
Собераем Docker образ
```
docker build -t mynginx
```
Создаем 2 вольюма
```
docker volume create volume-log
docker volume create volume-web
```
Запускаем контейнер с помощью команды в которой укажем проброс портов и добавление двух вольюмов, один для логов приложения, другой для web-страниц:
```
docker run -d -p 80:80 -p 3000:3000 -v volume-log:/var/log/nginx -v volume-web:/usr/share/nginx/html mynginx
```
После этого можно проверить работу через браузер, перейти по следующим адресам http://localhost:80 и http://localhost:3000 или через терминал "curl localhost:80" и "curl localhost:3000"
