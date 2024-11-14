def process_data(input_file, output_file):
    with open(input_file, 'r') as file:
        data = file.read()

    processed_data = data.replace(')', '),')

    with open(output_file, 'w') as file:
        file.write(processed_data)

# Пример использования
process_data('NULL_Data_Souvenir.txt', '5_New.txt')
