CREATE OR REPLACE FUNCTION ValidateSouvenirCategory()
RETURNS TRIGGER AS $$
BEGIN
     IF NEW.Name IS NOT NULL AND NEW.Name NOT LIKE UPPER(SUBSTRING(NEW.Name FROM 1 FOR 1)) || '%' THEN
        RAISE EXCEPTION 'Имя "%" с маленькой буквы', NEW.Name;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER CheckCategory
BEFORE INSERT OR UPDATE ON SouvenirsCategories
FOR EACH ROW EXECUTE FUNCTION ValidateSouvenirCategory();

