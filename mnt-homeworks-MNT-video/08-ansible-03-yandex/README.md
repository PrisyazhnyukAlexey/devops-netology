# Домашнее задание к занятию 3 «Использование Ansible»

## Структура

  Terraform Папка . В ней описан код для создания трех виртуальных машин в yandex cloud. \
  Ansible в папке terraform. В ней описан код по установке и настроке vector,clickhouse,LightHouse 

 # Terraform

 1. создает сеть develop
 2. создает подсеть develop с адресом 10.0.1.0/24
 3. считывает образ для Centos-7
 4. создает 3 тачки с именем example , vector , lighthouse 
 5. передает ssh ключ для подключения ко всем тачкам
 6. создает файл hosts.yml из шаблона hosts.tftpl
 7. создает файл vector.yml из шаблона vector.tftpl
 8. запускает ansible playbook

 файлы:
 
 ```
 centos.json
 data.tf -  создание пользователя из шаблона linux.tpl и передача ключа ssh
 hosts.tftpl - шаблон для создание инвентори файла для ansible playbook
 lighthouse.tf - создание виртуальной машины lighthouse
 linux.tpl - шаблон для создание пользователя 
 locals.tf - локальные переменные (в данном случаи использовалось для тестов)
 main.tf - создание сети, подсети, виртуальной машины Example(clickhouse), создание шаблона через local_file, запуск ansible-playbook 
 variables.tf - переменные
 vector.tf - создание виртуальной машины Vector
 vector.tftpl - шаблон для создания конфиг-файла vector.yml
 ```
# Ansible
плейбук находится в папке  terraform/ansible/* \
Иерархия:
- Ansible/
    - site.yml
    - group_vars/
        - clickhouse
            - clickhouse.yml
        - vector
            - vector.yml (появляется после применения terraform)
        - lighthouse
            - lighthouse.yml
    - inventory/(for local testing)
    - templates/
        - lighthouse.conf.j2
        - nginx.conf.j2
        - vector.service.j2
        - vector.yml.j2

## Структура
1. Install Clickhouse
    - Handlers: Start clickhouse service
    -  Task: Get clickhouse distrib
    - Task: Install clickhouse packages
    - Task: Create database
2. Install Vector
    - Handlers: Start Vector service
    - Task:  Get vector distrib
    - Task: Install vector packages
    - Task: Create vector config file (vector.yml)
    - Task: Vector systemd unit (vector.service)
3. Install nginx
    - Handlers: start-nginx
    - Task: Install epel-release
    - Task: Install nginx
    - Task: Create general config (nginx.conf.j2)
4. Install Lighthouse
    - Handlers: reload-nginx
    - Pre_tasks:  Install dependencies
    - Task:  Copy from git
    - Task:  Create lighthouse config (lighthouse.conf.j2)

# Ссылки
https://github.com/djohnii/devops-netology/tree/main/mnt-homeworks-MNT-video/08-ansible-03-yandex/terraform
