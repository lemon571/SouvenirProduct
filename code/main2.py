import numpy as np

def process_data(input_file, output_file):
    # Читаем данные из файла построчно
    with open(input_file, 'r') as file:
        data = [line.strip() for line in file]

    # Обрабатываем каждое значение
    processed_data = []
    for value in data:
        if value.lower() == 'nan':
            processed_data.append('NULL')
        else:
            try:
                processed_data.append(str(float(value)))
            except ValueError:
                processed_data.append(value)

    # Записываем обработанные данные в выходной файл
    with open(output_file, 'w') as file:
        for item in processed_data:
            file.write(item + '\n')

# Пример использования
#process_data('Weight.txt', 'New_weight.txt')
#process_data('QTypics.txt', 'New_QTypics.txt')
#process_data('AppMethod.txt', 'Null_AppMethod.txt')
process_data('Data_Souvenir.txt', 'NULL_Data_Souvenir.txt')
