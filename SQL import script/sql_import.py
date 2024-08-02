import pandas as pd
import argparse

def read_csv(file_path):
    """
    Read data from a CSV file using pandas and return it as a DataFrame.
    """
    return pd.read_csv(file_path)

def check_missing_values(data):
    """
    Check for missing values in the data and return their indices.
    """
    missing_indices = []
    for column in data.columns:
        missing_indices.extend(data.index[data[column].isnull()].tolist())
    return missing_indices

def convert_to_tuples(data):
    """
    Convert the data into a list of tuples.
    Replace NaN values with "null".
    """
    return [tuple(map(lambda x: "null" if pd.isna(x) else x, row)) for row in data.values]

def save_to_text_file(data, output_file, encoding='utf-8'):
    """
    Save data to a text file with each row enclosed in tuple brackets.
    """
    with open(output_file, 'w', encoding=encoding) as txtfile:
        for tuple_row in data:
            txtfile.write(str(tuple_row) + ',' + '\n')

def main():
    parser = argparse.ArgumentParser(description='Process CSV data and save it to a text file.')
    parser.add_argument('input_csv', help='Input CSV file')
    parser.add_argument('output_txt', help='Output text file')

    args = parser.parse_args()
    input_csv = args.input_csv
    output_txt = args.output_txt

    # Read data from CSV
    data = read_csv(input_csv)

    # Check for missing values
    missing_indices = check_missing_values(data)
    if missing_indices:
        print("Missing values found at the following indices:")
        print(missing_indices)

    # Convert data to list of tuples
    tuples_list = convert_to_tuples(data)

    # Save data to text file
    save_to_text_file(tuples_list, output_txt)
    print("Data saved to text file.")

if __name__ == "__main__":
    main()
