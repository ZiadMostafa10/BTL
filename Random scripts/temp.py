import csv
from math import radians, sin, cos, sqrt, atan2

def haversine(lat1, lon1, lat2, lon2):
    # Radius of the Earth in kilometers
    R = 6371.0

    # Convert latitude and longitude from degrees to radians
    lat1, lon1, lat2, lon2 = map(radians, [lat1, lon1, lat2, lon2])

    # Calculate the differences between latitudes and longitudes
    dlat = lat2 - lat1
    dlon = lon2 - lon1

    # Haversine formula to calculate distance
    a = sin(dlat / 2)**2 + cos(lat1) * cos(lat2) * sin(dlon / 2)**2
    c = 2 * atan2(sqrt(a), sqrt(1 - a))

    # Distance in kilometers
    distance = R * c

    return distance

def group_coordinates(csv_filename, threshold_distance):
    groups = []

    with open(csv_filename, 'r', encoding='utf-8') as csvfile:
        reader = csv.DictReader(csvfile)
        coordinates = [
            {
                'latitude': float(row['Latitude']),
                'longitude': float(row['Longitude']),
                'Territory': row['Territory'],
                'Sub-Territory': row['Sub-Territory'],
                'Place_ID': row['Place_ID']
            } for row in reader
        ]

    for coord in coordinates:
        # Try to add the coordinate to an existing group
        added_to_group = False
        for group in groups:
            group_coord = group[0]
            distance = haversine(coord['latitude'], coord['longitude'], group_coord['latitude'], group_coord['longitude'])

            if distance <= threshold_distance:
                group.append(coord)
                added_to_group = True
                break

        # If the coordinate doesn't belong to any existing group, create a new group
        if not added_to_group:
            groups.append([coord])

    return groups

def write_to_csv(output_filename, groups):
    with open(output_filename, 'w', encoding='utf-8', newline='') as csvfile:
        fieldnames = ['group_id', 'latitude', 'longitude', 'Territory', 'Sub-Territory', 'Place_ID']
        writer = csv.DictWriter(csvfile, fieldnames=fieldnames)
        writer.writeheader()

        for group_id, group in enumerate(groups, start=1):
            for coord in group:
                writer.writerow({
                    'group_id': group_id,
                    'latitude': coord['latitude'],
                    'longitude': coord['longitude'],
                    'Territory': coord['Territory'],
                    'Sub-Territory': coord['Sub-Territory'],
                    'Place_ID': coord['Place_ID']
                })

if __name__ == "__main__":
    # Specify the CSV file name and distance threshold
    csv_filename = 'test1.csv'  # Replace with your actual file name
    threshold_distance = 2.0  # Adjust the threshold as needed

    # Call the function to group coordinates
    result_groups = group_coordinates(csv_filename, threshold_distance)

    # Specify the output CSV file name
    output_filename = 'grouped_coordinates.csv'

    # Call the function to write the results to a new CSV file
    write_to_csv(output_filename, result_groups)

    print(f"Results written to '{output_filename}'.")
