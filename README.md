# telman-devops_microservices
telman-devops microservices repository

## Выполнено ДЗ 12

Создан Dockerfile

Загружен в docker registry

Выполнено задание со *

## Выполнено ДЗ 13

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
