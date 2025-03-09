-- Создаём индексы для часто повторяющихся запросов
create index if not exists order_product_order_id_idx on order_product(order_id);
create index if not exists orders_status_date_idx on orders(status, date_created);