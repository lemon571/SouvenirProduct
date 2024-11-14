import pandas as pd

# Загрузка данных из Excel файла
file_path = 'data_souvenirs.xlsx'
data = pd.read_excel(file_path)

# Определение имени таблицы
table_name = 'dbo.Souvenirs'

# Функция для преобразования данных в SQL запросы
def generate_sql_insert(data):
    sql_queries = []
    
    for index, row in data.iterrows():
        # Подготовка значений для вставки
        values = []
        
        # Преобразование каждого столбца
        values.append(f"{int(row['ID'])}")  # ID
        values.append(f"'{row['URL']}'")  # URL
        values.append(f"'{row['ShortName']}'")  # ShortName
        values.append(f"'{row['Name']}'")  # Name
        values.append(f"'{row['Description']}'")  # Description
        values.append(f"{int(row['Rating'])}")  # Rating
        values.append(f"{int(row['IdCategory'])}")  # IdCategory
        values.append(f"{int(row['Id Color'])}")  # Id Color
        values.append(f"'{row['Size']}'")  # Size
        values.append(f"{int(row['IdMaterial'])}")  # IdMaterial
        
        # Обработка полей, которые могут быть пустыми
        values.append(f"'{row['Weight']}'" if pd.notnull(row['Weight']) else "NULL")  # Weight
        values.append(f"'{row['QTypics']}'" if pd.notnull(row['QTypics']) else "NULL")  # QTypics
        values.append(f"'{row['PicsSize']}'" if pd.notnull(row['PicsSize']) else "NULL")  # PicsSize
        values.append(f"'{row['IdApplication']}'")  # IdApplication
        
        # Остальные поля, которые могут быть пустыми
        values.append(f"'{row['AllCategories']}'" if pd.notnull(row['AllCategories']) else "NULL")
        values.append(f"'{row['DealerPrice']}'" if pd.notnull(row['DealerPrice']) else "NULL")
        values.append(f"'{row['Price']}'")  # Price
        values.append(f"'{row['Comments']}'" if pd.notnull(row['Comments']) else "NULL")  # Comments
        
        # Формирование SQL запроса
        sql_query = f"INSERT INTO {table_name} (ID, URL, ShortName, Name, Description, Rating, IdCategory, [Id Color], Size, IdMaterial, Weight, QTypics, PicsSize, IdApplication, AllCategories, DealerPrice, Price, Comments) VALUES ({', '.join(values)});"
        sql_queries.append(sql_query)

    return sql_queries

# Генерация SQL запросов
sql_inserts = generate_sql_insert(data)

# Запись SQL запросов в файл
with open('sqlinsert.txt', 'w', encoding='utf-8') as file:
    for query in sql_inserts:
        file.write(query + 'n')

print("SQL запросы успешно записаны в файл sqlinsert.txt.")
