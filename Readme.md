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

## какое количество сосисок было продано
Запрос показывает какое количество сосисок было продано за каждый день предыдущей недели.
```postgresql
select 
	o.date_created, 
	SUM(op.quantity) 
from orders as o
join order_product as op on o.id = op.order_id
where 1=1
	and o.status = 'shipped' 
	and o.date_created > now() - interval '7 DAY'
group by o.date_created;
```