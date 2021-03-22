USE tradecompany
go
--task 1 �������� ������ ���� �������, ����������� � �������� �������� 

SELECT goods.goods_id, goods.item_name FROM (
	goods JOIN (SELECT * FROM current_goods WHERE current_goods.shop_id = 4) AS TEMP
	ON goods.goods_id = TEMP.goods_id
)

-- task 2 �������� ������ �������, ��������� ������� ��������� � ��� �� ������, 
-- ��� � �������, �� ���������:
 
SELECT current_goods.goods_id FROM (
current_goods JOIN 
(SELECT shop_id, sup_id FROM suppliers JOIN shops ON suppliers.city = shops.city) as temp
	ON temp.shop_id = current_goods.shop_id AND temp.sup_id = current_goods.sup_id
) 

-- task 3
-- 3.	�������� ������ ���� ������������, �������� ������, ���������� �� ������ ��������:

SELECT DISTINCT sold_goods.cust_id FROM (
sold_goods JOIN
	(SELECT goods.goods_id FROM goods WHERE goods.item_price < 100) AS temp
	ON sold_goods.goods_id = temp.goods_id)

-- task 4
-- �������� ������ �����������, ������� ��������� �������� ����� � ������� � �������� �������

SELECT DISTINCT current_goods.sup_id FROM (
current_goods JOIN 

(SELECT shops.shop_id FROM shops WHERE 
							shops.city = '������' AND 
							shops.street = '1 ������ �����' AND 
							shops.house_nm = 12) AS t1
	ON t1.shop_id = current_goods.shop_id
) WHERE current_goods.goods_id = 1


-- task 5 �������� ���� (����� ������, ��� ����������), ����������� ����� ��������,
-- � ������� ������������� �������� �����������.
SELECT DISTINCT current_goods.goods_id, current_goods.sup_id FROM (
current_goods JOIN 
(SELECT sold_goods.shop_id FROM sold_goods WHERE sold_goods.cust_id = 1) AS t1
	ON current_goods.shop_id = t1.shop_id)


-- task 6 �������� ������ ��� (�������, �����), � ������� ��������� �������� 
--	����� �� ��������� ����������
SELECT * FROM (
shops JOIN 
(SELECT DISTINCT current_goods.shop_id from current_goods
	WHERE current_goods.goods_id = 1 AND current_goods.sup_id = 2) AS t1
	ON t1.shop_id = shops.shop_id
)