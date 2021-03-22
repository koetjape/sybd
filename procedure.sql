CREATE PROCEDURE cp_add_store
@shop_id int,
@shop_rating int,
@city varchar(30),
@street varchar(30),
@house_nm int
AS
BEGIN 
	INSERT INTO shops(shop_id, shop_rating, city, street, house_nm) 
		VALUES(@shop_id, @shop_rating, @city, @street, @house_nm)
	SELECT * FROM shops

END;
GO
