USE tradecompany
GO

CREATE TABLE shops
(
	shop_id int NOT NULL CHECK(shop_id > 0),
	shop_rating int NOT NULL CHECK(shop_rating > 0 AND shop_rating < 11),
	city varchar(30) NOT NULL,
	street varchar(30) NOT NULL,
	house_nm int NOT NULL CHECK(house_nm > 0),
	PRIMARY KEY(shop_id)


)
go

CREATE TABLE suppliers
(
	sup_id int NOT NULL CHECK(sup_id > 0),
	sup_name varchar(30) NOT NULL,
	city varchar(30) NOT NULL,
	street varchar(30) NOT NULL,
	house_nm int NOT NULL CHECK(house_nm > 0),
	PRIMARY KEY(sup_id)
	
)

CREATE TABLE goods
(
	goods_id int NOT NULL CHECK(goods_id > 0),
	item_name varchar(30) NOT NULL,
	item_price int NOT NULL CHECK(item_price > 0),
	item_type varchar(30) NOT NULL,
	PRIMARY KEY(goods_id)
)
go

CREATE TABLE customers
(
	cust_id int NOT NULL CHECK(cust_id > 0),
	cust_name varchar(30) NOT NULL,
	cust_surname varchar(30) NOT NULL,
	cust_age int NOT NULL CHECK(cust_age > 0 AND cust_age < 150),
	cust_gender varchar(1) NOT NULL CHECK(cust_gender in ('w', 'm')),
	PRIMARY KEY(cust_id)

)
go

CREATE TABLE sold_goods
(	
	shop_id int NOT NULL CHECK (shop_id > 0),
	goods_id int NOT NULL CHECK(goods_id > 0),
	cust_id int NOT NULL CHECK(cust_id > 0),

	PRIMARY KEY(shop_id, goods_id, cust_id),

	m_year int NOT NULL CHECK (m_year > 1900 AND m_year < 2030),
	m_month int NOT NULL CHECK (m_month >= 1 AND m_month <= 12),
	m_day int NOT NULL CHECK (m_day >= 1 AND m_day <= 31)
)
go

CREATE TABLE current_goods
(	
	shop_id int NOT NULL CHECK (shop_id > 0),

	goods_id int NOT NULL CHECK(goods_id > 0),

	sup_id int NOT NULL CHECK(sup_id > 0),
	PRIMARY KEY(shop_id, goods_id, sup_id)
)
go

ALTER TABLE sold_goods ADD FOREIGN KEY(shop_id)
					REFERENCES shops(shop_id)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION 
go

ALTER TABLE sold_goods ADD FOREIGN KEY(goods_id) 
					REFERENCES goods(goods_id)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION
go

ALTER TABLE sold_goods ADD FOREIGN KEY(cust_id) 
					REFERENCES customers(cust_id)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION
go

-- в данный момент стоит CASCADE, потому что если магазин не будет в торговой компании,
-- то и товары не смогут продаваться в данный момент времени 
ALTER TABLE current_goods ADD FOREIGN KEY(shop_id) 
					REFERENCES shops(shop_id)
					ON DELETE CASCADE
					ON UPDATE CASCADE
go

ALTER TABLE current_goods ADD FOREIGN KEY(goods_id) 
					REFERENCES goods(goods_id)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION
go

ALTER TABLE current_goods ADD 
					FOREIGN KEY(sup_id) REFERENCES suppliers(sup_id)
					ON DELETE NO ACTION
					ON UPDATE NO ACTION
go