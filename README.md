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

> Поднять Docker-хост в AWS

```
url: https://blog.scottlowe.org/2016/03/22/using-docker-machine-with-aws/

docker-machine create -d amazonec2 \
--amazonec2-region eu-central-1 \
--amazonec2-instance-type "t2.medium" \
--amazonec2-ssh-keypath ~/.ssh/id_rsa \
logging

eval $(docker-machine env logging)
```

> Остановить Docker-хост в AWS

```
docker-machine rm logging

eval $(docker-machine env --unset)
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

## Выполнено ДЗ 19

1. Настроен Gitlab-server

2. Создан gitlab-runner

3. Описан .gitlab-ci.yml

4. Сборка и деплой reddit в gitlab registry

## Выполнено ДЗ 20

1. Запустили Prometheus
2. Настроили мониторинг наших микросервисов

## Выполнено ДЗ 21

1. Подготовили окружения docker-machine
2. Настроили Elastic Stack: Fluentd -> ElasticSearch -> Kibana
3. Сбор структурированных логов с помошью Fluentd
4. Визаулизация с помощью Kibana
5. Сбор неструктурированных логов и парсинг с помощью Grok-шаблонов
6. Распределенный трейсинг Zipkin
