## Работа с докером на основе Static-jinja-plus

### Установка Docker
Установите Docker, если у вас Windows используйте Docker Desktop и wsl2.
Проверьте работу Docker в командной строке:

```
docker --version
```

Пройдите по ссылке и зарегистрируйтесь на сайте [Docker Hub](https://hub.docker.com/).

### Собрать образ из готового Dockerfile

Внутри директории с ДокерФайлом выполните команду:
```
docker build -t <имя_образа>:<тег> .
```
Замените `<имя_образа>` и `<тег>` на желаемые значения. Флаг `-t` используется для указания тега образа. 
Точка (.) в конце команды указывает на текущую папку как на контекст сборки.
Например, если вы хотите назвать образ "my-app" с тегом "latest", команда будет выглядеть так:

```
docker build -t my-app:latest .
```

У нас несколько разных версий приложения, соответственно несколько ДокерФайлов. Поэтому воспользуйтесь флагом `-f`, чтобы запускать из разных мест.

```
docker build -t <имя_образа>:<тег> -f <путь, где лежит докерфайл> .
```
После этого мы можем проверить образы командой - ```Docker images```.

Для того, чтобы выложить наши образы в репозиторий на ДокерХаб воспользуйтесь командой:
```
docker push <имя_образа>:<тег>

docker push kodunaiff/static-jinja-plus:develop
```


### Создаем разные версии образов

Если вам необходимо изменить `version` и `checksum`, используйте команду:
```
curl -sL https://github.com/MrDave/StaticJinjaPlus/archive/refs/tags/0.1.1.tar.gz | sha256sum
результат: 30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b
```

#### Создаем образ develop:
```
docker build -t kodunaiff/static-jinja-plus:develop -f develop/ubuntu/Dockerfile .
```
#### Создаем образ develop-slim:
```
docker build -t kodunaiff/static-jinja-plus:develop-slim -f develop/python-slim/Dockerfile .
```
#### Создаем образ 0.1.0
```
docker build --build-arg VERSION="0.1.0" --build-arg CHECKSUM="3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444" -t kodunaiff/static-jinja-plus:0.1.0 -f 0.1/ubuntu/Dockerfile .
```
#### Создаем образ 0.1.1
```
docker build --build-arg VERSION="0.1.1" --build-arg CHECKSUM="30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b" -t kodunaiff/static-jinja-plus:0.1.1 -f 0.1/ubuntu/Dockerfile .
```
#### Создаем образ 0.1.0-slim
```
docker build --build-arg VERSION="0.1.0" --build-arg CHECKSUM="3555bcfd670e134e8360ad934cb5bad1bbe2a7dad24ba7cafa0a3bb8b23c6444" -t kodunaiff/static-jinja-plus:0.1.0-slim -f 0.1/python-slim/Dockerfile .
```
#### Создаем образ 0.1.1-slim
```
docker build --build-arg VERSION="0.1.1" --build-arg CHECKSUM="30d9424df1eddb73912b0e2ad5375fa2c876c8e30906bec91952dfb75dcf220b" -t kodunaiff/static-jinja-plus:0.1.1-slim -f 0.1/python-slim/Dockerfile .
```
#### Создаем образ latest
```
docker build -t kodunaiff/static-jinja-plus -f develop/ubuntu/Dockerfile .
```
#### Создаем образ slim
```
docker build -t kodunaiff/static-jinja-plus:slim -f develop/python-slim/Dockerfile .
```



#### Для теста выполните команду:

```
docker run --rm -v "path/for/your/templates:/app/templates" -v "path/for/your/build:/app/build" your_dockerhub_username/static-jinja-plus:<tag>
```

## Цели проекта

Код написан в учебных целях — это урок в курсе по Python и веб-разработке на сайте [Devman](https://dvmn.org).
