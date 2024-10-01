## Работа с докером на основе Static-jinja-plus

### Установка docker
Установите Docker, если у вас Windows используйте Docker Desktop и wsl2 (ubuntu).

Запустите его в командной строке:

```
docker --version
```

###
Собрать образ из готового Dockerfile

Внутри директории с докерфайлом выполните команду

```
docker build -t <имя_образа>:<тег> .
```
Замените `<имя_образа>` и `<тег>` на желаемые значения. Например, если вы хотите назвать образ "my-app" с тегом "latest", команда будет выглядеть так:

```
docker build -t my-app:latest .
```
Флаг -t используется для указания тега образа. Точка (.) в конце команды указывает на текущую папку как на контекст сборки.
```


#### Для теста выполните команду:

```
docker run --rm -v "path/for/your/templates:/app/templates" -v "path/for/your/build:/app/build" your_dockerhub_username/static-jinja-plus:<tag>
```
