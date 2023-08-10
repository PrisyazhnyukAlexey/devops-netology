# Домашнее задание к занятию 7 «Жизненный цикл ПО»

## Подготовка к выполнению

1. Получить бесплатную версию [Jira](https://www.atlassian.com/ru/software/jira/free).
2. Настроить её для своей команды разработки.
3. Создать доски Kanban и Scrum.

## Основная часть

Необходимо создать собственные workflow для двух типов задач: bug и остальные типы задач. Задачи типа bug должны проходить жизненный цикл:

1. Open -> On reproduce.
2. On reproduce -> Open, Done reproduce.
3. Done reproduce -> On fix.
4. On fix -> On reproduce, Done fix.
5. Done fix -> On test.
6. On test -> On fix, Done.
7. Done -> Closed, Open.

   ![image](https://github.com/djohnii/devops-netology/assets/91311426/c6dcd9bf-2f9d-42a1-87da-42a933626d7e)



Остальные задачи должны проходить по упрощённому workflow:

1. Open -> On develop.
2. On develop -> Open, Done develop.
3. Done develop -> On test.
4. On test -> On develop, Done.
5. Done -> Closed, Open.

  ![image](https://github.com/djohnii/devops-netology/assets/91311426/ade4881c-ad9d-470f-a3b8-e62bbb7616cd)



**Что нужно сделать**

1. Создайте задачу с типом bug, попытайтесь провести его по всему workflow до Done.
   ![image](https://github.com/djohnii/devops-netology/assets/91311426/23bc409d-9eea-4b50-91ae-7e86399804fc)
 
2 Создайте задачу с типом epic, к ней привяжите несколько задач с типом task, проведите их по всему workflow до Done.
   ![image](https://github.com/djohnii/devops-netology/assets/91311426/123f85b1-34fe-4abb-bf40-a4865dc4bd95)
 
3 При проведении обеих задач по статусам используйте kanban
   ![image](https://github.com/djohnii/devops-netology/assets/91311426/bb5b9bb7-f26b-419f-87a1-d62edd9e6a7b)
 
4 Верните задачи в статус Open.
   ![image](https://github.com/djohnii/devops-netology/assets/91311426/09f1a8ab-13c5-4992-8ea2-7b820457f0e5)

5 Перейдите в Scrum, запланируйте новый спринт, состоящий из задач эпика и одного бага, стартуйте спринт, проведите задачи до состояния Closed. Закройте спринт.
   ![image](https://github.com/djohnii/devops-netology/assets/91311426/b4b52de4-9411-47c2-8c2d-051a30ff4a53)

6 Если всё отработалось в рамках ожидания — выгрузите схемы workflow для импорта в XML. Файлы с workflow и скриншоты workflow приложите к решению задания.

https://github.com/djohnii/devops-netology/blob/main/mnt-homeworks-MNT-video/09-ci-01-intro/2.xml
https://github.com/djohnii/devops-netology/blob/main/mnt-homeworks-MNT-video/09-ci-01-intro/1.xml
---


### Как оформить решение задания

Выполненное домашнее задание пришлите в виде ссылки на .md-файл в вашем репозитории.

---

