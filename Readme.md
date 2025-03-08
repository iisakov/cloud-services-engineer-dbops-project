# dbops-project
Исходный репозиторий для выполнения проекта дисциплины "DBOps"

## Создание БД в PostgreSQL.
Создайте ещё одну БД в PostgreSQL, допустим, это будет база store.

```postgresql
create database store;
```

## Создание нового пользователя PostgreSQL
Создайте нового пользователя PostgreSQL и выдайте ему права на все таблицы в базе store. Под этим логином будут ходить автотесты и выполняться миграции.

```postgresql
create role autotest with login password 'autotest';
grant all on database store to autotest;
grant usage, create on schema public to autotest;
```

Если вдруг нужно удалить пользователя autotest
```postgresql
drop owned by autotest;
drop role autotest;
```