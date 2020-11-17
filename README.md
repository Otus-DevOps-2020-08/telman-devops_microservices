# telman-devops_microservices
telman-devops microservices repository

## Выполнено ДЗ 16

Создан Dockerfile

Загружен в docker registry

Выполнено задание со *

## Выполнено ДЗ 17

> Создан Docker-хост в Yandex Cloud

```
$ docker-machine create \
  --driver generic \
  --generic-ip-address=<ПУБЛИЧНЫЙ_IP_СОЗДАНОГО_ВЫШЕ_ИНСТАНСА> \
  --generic-ssh-user yc-user \
  --generic-ssh-key ~/.ssh/id_rsa \
  docker-host
```

> Создана сеть reddit
```
docker network create reddit
```

> Добавлен volume для mongo
```
docker volume create reddit_db
```

Микросервисная архитектура в папке ./src работает корректно

## Выполнено ДЗ 18

> Бал поднят Docker-хост в AWS

```
docker-machine create -d amazonec2 \
--amazonec2-region us-west-2 \
--amazonec2-instance-type "t2.micro" \
--amazonec2-ssh-keypath ~/.ssh/id_rsa \
docker-host
```

> Создана docker сеть,
```
docker network create back_net --subnet=10.0.2.0/24
docker network create front_net --subnet=10.0.1.0/24
```

```
docker run -d --network=front_net -p 9292:9292 --name ui 870414/ui:1.0
docker run -d --network=back_net --name comment 870414/comment:1.0
docker run -d --network=back_net --name post 870414/post:1.0
docker run -d --network=back_net --name mongo_db \
 --network-alias=post_db --network-alias=comment_db mongo:latest
```

```
docker network connect front_net post
docker network connect front_net comment
```

> Создан и протестирован файл docker-compose.yml с вынесенными переменными в файл .env

> Базовое имя проекта по умолчанию берется из название проекта, если нужно переопределить:

```
docker-compose --project-name $NAME up -d
```
