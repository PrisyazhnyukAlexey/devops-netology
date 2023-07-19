# Домашнее задание к занятию 4 «Работа с roles»


## Основная часть


1. Создайте в старой версии playbook файл `requirements.yml` и заполните его содержимым:

   ```yaml
   ---
     - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
       scm: git
       version: "1.11.0"
       name: clickhouse 
   ```

2. При помощи `ansible-galaxy` скачайте себе эту роль.
```
ansible-galaxy install -r requirements.yml -p roles
```
3. Создайте новый каталог с ролью при помощи `ansible-galaxy role init vector-role`.
```
ansible-galaxy role init vector-role
```
4. На основе tasks из старого playbook заполните новую role. Разнесите переменные между `vars` и `default`. 
5. Перенести нужные шаблоны конфигов в `templates`.
6. Опишите в `README.md` обе роли и их параметры.
7. 
# Role [ansible_lighthouse](https://github.com/djohnii/ansible_lighthouse)

Данная роль устанавливает nginx , создает для него конфиг файл и перезапускает nginx. Далее система устанавливает git и с помощью него устанавливает Lighthouse . Добавляет конфиг файл для Lighthouse и снова перезапускает nginx. \
## Переменные
| vars | description |
|-------|-------------|
|lighthouse_vcs| path for app lighthouse in git |
|lighthouse_location_dir| this path will save applications from git |
|lighthouse_access_log_name| lighthouse access log name |
|nginx_user_name| user for nginx service |

##  NGINX | Install epel-release
Данный плей устанавливает epel-release

## NGINX | Install nginx

Данный плей устанавливает nginx и запускает его.

##  NGINX | Create general config

Данный плей создает конфигурационный файл для nginx из nginx.conf.j2 и копирует его в /etc/nginx/nginx.conf . После копирования конфиг файла необходимо перезапустить сервис nginx. Это делается автоматически после копирования конфиг файла с помощью   `` notify: reload-nginx`` 

 ## Lighthouse | Install dependencies

 Устанавливаем git 

 ## Lighthouse | Copy from git

 Копируем из git lighthouse.Далее создаем из темплейта конфиг файл (lighthouse.conf.j2)  и копируем его в nginx  /etc/nginx/conf.d/default.conf

# Role [ansible_vector](https://github.com/djohnii/ansible_vector) 
Данная роль скачивает пакет vector.rpm , инсталирует скаченные пакет , создает из шаблонов vector.yml.j2 в /etc/vector/vector.yml и vector.service.j2 в /usr/lib/systemd/system/vector.service. \
С помощью vector.service указываем запуск приложения используя созданный нами конфиг с помощью команды ``ExecStart=/usr/bin/vector --config /etc/vector/vector.yml``

## Переменные
| vars | description |
| ----- | ---------------- |
|vector_version| app version |
|vector_type| type vector logs |
|vector_format| format for vector logs|
|vector_sinks_type| synchronization with data storage |
|vector_sinks_inputs| connect  sink to your source |
|vector_sinks_database| database for storage  |
|vector_sinks_table| table in database |

| vars(default) | description |
|--------------| ---------------------- |
| clickhouse_ip | ip address for connect to database |

## Get vector distrib

Скачиваем дистрибутив vector. Используется переменная ``vector_version`` 

##  Install vector packages

Устанавливаем скаченные дистрибутив. После установки запускаем сервис с помощью handler ``notify: Start Vector service``

##  Create vector config file

Создаем конфигурационный файл из шаблона vector.yml.j2 и копируем его по пути /etc/vector/vector.yml. Указываем владельца файлаи группу.

##  Vector systemd unit

Создаем конфигурационный файл из шаблона  vector.service.j2 и копируем его по пути  /usr/lib/systemd/system/vector.service. Задаем владельца и группу файла. Вызываем хендлер для перезапуска сервиса.


--------------------------------------

7. Повторите шаги 3–6 для LightHouse. Помните, что одна роль должна настраивать один продукт.
8. Выложите все roles в репозитории. Проставьте теги, используя семантическую нумерацию. Добавьте roles в `requirements.yml` в playbook.
```
---
  - src: git@github.com:AlexeySetevoi/ansible-clickhouse.git
    scm: git
    version: "1.11.0"
    name: clickhouse 

  - src: git@github.com:djohnii/ansible_vector.git
    scm: git
    version: "1.0.0"
    name: ansible_vector

  - src: git@github.com:djohnii/ansible_lighthouse.git
    scm: git
    version: "1.0.0"
    name: ansible_lighthouse 
```

9. Переработайте playbook на использование roles. Не забудьте про зависимости LightHouse и возможности совмещения `roles` с `tasks`.
```
---
- name: Install Clickhouse
  hosts: clickhouse
  roles: clickhouse


- name: Install vector
  hosts: vector
  roles: vector-role


- name: Install Lighthouse
  hosts: lighthouse
  roles: lighthouse-role
```
10. Выложите playbook в репозиторий.
11. В ответе дайте ссылки на оба репозитория с roles и одну ссылку на репозиторий с playbook.

[lighthouse](https://github.com/djohnii/ansible_lighthouse) \
[vector](https://github.com/djohnii/ansible_vector) \
[playbook](https://github.com/djohnii/devops-netology/tree/main/mnt-homeworks-MNT-video/08-ansible-04-role/ansible)
---


