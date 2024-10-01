## Работа с докером на основе Static-jinja-plus

### Установка docker
Установите Docker, если у вас Windows используйте Docker Desktop и wsl2 (ubuntu).

Запустите его в командной строке:

docker --version

#### Для теста выполните команду:

```
docker run --rm -v "path/for/your/templates:/app/templates" -v "path/for/your/build:/app/build" your_dockerhub_username/static-jinja-plus:<tag>
```
