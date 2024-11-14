import pandas as pd

def process_data(input_file, output_file):
    column_names = ['ID', 'URL', 'ShortName', 'Name', 'Description', 'Rating', 'IdCategory', 'IdColor', 'Size', 'IdMaterial', 'Weight', 
                    'Qtypics', 'PicsSize', 'IdApplicMetod', 'AllCategories', 'DealerPrice', 'Price', 'Comments']

    data = pd.read_excel(input_file)

    with open(output_file, 'w') as file:
        for _, row in data.iterrows():
            processed_row = []
            for col in column_names:
                value = row[col]
                if pd.notnull(value) and str(value).lower() != 'null':
                    if col in ['URL', 'ShortName', 'Name', 'Description', 'Size', 'Weight', 
                               'Qtypics', 'PicsSize', 'AllCategories', 'DealerPrice', 'Price', 'Comments']:
                        processed_row.append(f"'{str(value)}'")
                    else:
                        processed_row.append(str(value))
                else:
                    processed_row.append(str(value))
            file.write(f"({', '.join(processed_row)})\n")

process_data('4.xlsx', '4.txt')

