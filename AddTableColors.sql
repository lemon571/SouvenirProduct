DELETE FROM colors WHERE id = 1;

COPY colors (ID,Name) 
FROM 'C:\Users\ABCYu\Downloads\colors.csv' with (format csv, header true, encoding 'UTF-8')