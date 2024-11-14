from collections import OrderedDict

def encode_data_from_file(input_file, output_file):
    # Создаем упорядоченный словарь для хранения уникальных элементов и их кодировок
    unique_elements = OrderedDict()
    
    # Инициализируем список для хранения закодированных данных
    encoded_data = []
    
    # Читаем данные из файла построчно
    with open(input_file, 'r', encoding='utf-8') as f:
            lines = f.readlines()
            for line in lines:
                # Удаляем лишние пробелы и символ табуляции
                item = line.strip()
                
                # Кодируем элемент
                if item not in unique_elements:
                    unique_elements[item] = len(unique_elements) + 1
                encoded_data.append(unique_elements[item])
            with open(output_file, 'w') as file:
               for code in encoded_data:
                    file.write(str(code) + '\n')

    
    return encoded_data

# Пример использования
#encoded_data = encode_data_from_file('Color.txt', 'ID_color.txt')
#encoded_data = encode_data_from_file('Material.txt', 'Id_material.txt')
encoded_data = encode_data_from_file('Null_AppMethod.txt', 'New_Id_AppMethod.txt')
