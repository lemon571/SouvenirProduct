CREATE OR REPLACE FUNCTION LowStock()
RETURNS TRIGGER AS $$
DECLARE
	inform TEXT;
	st_count INT;
BEGIN
	SELECT SUM(Amount) INTO st_count
	FROM SouvenirStores
	WHERE IdSouvenir = NEW.IdSouvenir;
	
	IF st_count IS NULL OR st_count < 50 THEN
		inform := 'Отсутствует поставка товара ' || NEW.IdSouvenir || '(количество товаров на данный момент:' 
																	|| st_count || 'ед.)';
		RAISE NOTICE '%', inform;
	END IF;
	
	RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckLowStock
AFTER INSERT OR UPDATE ON SouvenirStores
FOR EACH ROW
EXECUTE FUNCTION LowStock();
