CREATE TRIGGER trigger_for_test
ON shops
AFTER INSERT 
AS
UPDATE shops
SET for_trigger = shop_rating * 2
WHERE shop_id  = (SELECT shop_id FROM inserted) 