# import pandas as pd

# # Read the CSV file
# df = pd.read_csv('test1.csv', encoding='utf-8')

# # Sort the data based on 'Sub-Territory'
# df.sort_values(by=['Sub-Territory', 'Latitude', 'Longitude'], inplace=True)

# # Assign group IDs based on 'Sub-Territory'
# df['group_id'] = (df['Sub-Territory'] != df['Sub-Territory'].shift()).cumsum()

# # Save the result to a new CSV file
# output_file = 'clustered_output.csv'
# df.to_csv(output_file, index=False, encoding='utf-8')

# # Output the result
# print(f"Result saved to {output_file}")


import csv
from operator import itemgetter

def process_csv(input_filename, output_filename):
    # Read data from CSV file
    with open(input_filename, 'r', encoding='utf-8') as csv_file:
        csv_reader = csv.DictReader(csv_file)
        data = list(csv_reader)

    # Sort data by Sub-Territory, latitude, and longitude
    sorted_data = sorted(data, key=itemgetter('Sub-Territory', 'Latitude', 'Longitude'))

    # Process data to cluster based on Sub-Territory and group by latitudes and longitudes
    grouped_data = {}
    group_id = 1
    instances_in_group = 0
    current_sub_territory = None

    for record in sorted_data:
        if record['Sub-Territory'] != current_sub_territory:
            current_sub_territory = record['Sub-Territory']
            instances_in_group = 0
            group_id = 1

        record['group_id'] = group_id
        instances_in_group += 1

        # Check if the maximum instances per group is reached
        if instances_in_group == range(20,30):
            instances_in_group = 0
            group_id += 1

        if current_sub_territory not in grouped_data:
            grouped_data[current_sub_territory] = []

        grouped_data[current_sub_territory].append(record)

    # Write the processed data to a new CSV file
    with open(output_filename, 'w', encoding='utf-8', newline='') as csv_output_file:
        fieldnames = sorted_data[0].keys()
        csv_writer = csv.DictWriter(csv_output_file, fieldnames=fieldnames)

        csv_writer.writeheader()

        # Write the grouped data to the output file
        for sub_territory in grouped_data:
            csv_writer.writerows(grouped_data[sub_territory])

if __name__ == "__main__":
    # Replace 'input.csv' and 'output.csv' with your actual input and output filenames
    process_csv('test1.csv', 'output.csv')
