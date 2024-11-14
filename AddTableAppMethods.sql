DELETE FROM applicationmetods WHERE id = 1;

COPY applicationmetods (ID,Name) 
FROM 'C:\Users\ABCYu\Downloads\applicationMetods.csv' with (format csv, header true, encoding 'UTF-8')