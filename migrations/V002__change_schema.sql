-- Работа с таблицей product
alter table product add column if not exists price float8;
alter table product add constraint pk_product primary key (id); 										-- alter table product drop constraint pk_product;

-- Работа с таблицей orders
alter table orders add column if not exists date_created date default CURRENT_DATE;
alter table orders add constraint pk_order primary key (id); 											-- alter table orders drop constraint pk_order;

-- Работа с таблицей order_product
alter table order_product add constraint fk_product foreign key (product_id) references product(id); 	-- alter table order_product drop constraint fk_product;
alter table order_product add constraint fk_order foreign key (order_id) references orders(id); 		-- alter table order_product drop constraint fk_order;

-- Удаление ненужных таблиц
drop table if exists product_info;
drop table if exists orders_date;