def process_data(input_file, output_file):
    with open(input_file, 'r') as file:
        data = file.readlines()

    processed_data = []
    for line in data:
        parts = line.strip('()\n').split(', ')
        processed_parts = []
        for part in parts:
            if part == "'nan'":
                processed_parts.append('NULL')
            else:
                processed_parts.append(part)
        processed_data.append(f"({', '.join(processed_parts)})")

    with open(output_file, 'w') as file:
        file.write('\n'.join(processed_data))

# Пример использования
process_data('Data_Souvenir.txt', 'New_4.txt')
