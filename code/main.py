def process_file(input_file, output_file):
    try:
        with open(input_file, 'r', encoding='utf-8') as f:
            lines = f.readlines()
    except UnicodeDecodeError:
        with open(input_file, 'r', encoding='latin-1') as f:
            lines = f.readlines()

    output_lines = []
    for line in lines:
        parts = [part.strip() for part in line.strip().split(',')]
        output_line = f"({parts[0]}, {parts[1]}, '{parts[2]}')"
        output_lines.append(output_line)

    with open(output_file, 'w', encoding='utf-8') as f:
        f.write(',\n'.join(output_lines) + ',\n')

# Вызов функции для обработки файла
#process_file('Str.txt', 'Data_for_BD.txt')
process_file('NULL_Data_Souvenir.txt', 'Data_Souvenir_for_BD.txt')