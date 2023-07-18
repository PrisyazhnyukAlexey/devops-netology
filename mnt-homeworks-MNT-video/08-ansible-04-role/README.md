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

[lighthouse](https://github.com/djohnii/ansible_lighthouse)
[vector](https://github.com/djohnii/ansible_vector)
[playbook](https://github.com/djohnii/devops-netology/tree/main/mnt-homeworks-MNT-video/08-ansible-04-role/ansible)https://github.com/djohnii/devops-netology/tree/main/mnt-homeworks-MNT-video/08-ansible-04-role/ansible
---


