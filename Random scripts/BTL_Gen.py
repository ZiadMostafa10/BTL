import csv
import folium

def read_data(filename):
    users = []
    with open(filename, 'r') as csvfile:
        csvreader = csv.DictReader(csvfile)
        for row in csvreader:
            user_id = row.get('User_ID', '')
            territory = row.get('Territory', '')
            sub_territory = row.get('Sub-Territory', '')
            latitude_str = row.get('Latitude', '')
            longitude_str = row.get('Longitude', '')
            place_id = row.get('Place_ID', '')

            # Check if latitude and longitude are not empty
            if latitude_str and longitude_str:
                try:
                    latitude = float(latitude_str)
                    longitude = float(longitude_str)
                    users.append((user_id, territory, sub_territory, latitude, longitude, place_id))
                except ValueError:
                    print(f"Skipping invalid coordinates for User ID: {user_id}")

    return users

def create_map_markers(users, suggested_days):
    if not users:
        print("No valid data to create the map.")
        return

    map = folium.Map(location=[users[0][3], users[0][4]], zoom_start=13)

    for user_info, day in zip(users, suggested_days):
        user_id, territory, sub_territory, latitude, longitude, place_id = user_info
        folium.Marker([latitude, longitude], popup=f"{user_id} (Day {day}), Place ID: {place_id}").add_to(map)

    return map

def assign_suggested_days(users, proximity_threshold, min_visits=20, max_visits=30, total_days=12):
    suggested_days = [0] * len(users)

    for territory, sub_territory in set((user_info[1], user_info[2]) for user_info in users):
        # Filter users based on territory and sub-territory
        sub_territory_users = [user_info for user_info in users if user_info[1] == territory and user_info[2] == sub_territory]
        sub_territory_users.sort(key=lambda x: (x[3], x[4]))  # Sort by proximity

        current_day = 1
        user_visits = {user_info[0]: 0 for user_info in sub_territory_users}

        for user_info in sub_territory_users:
            user_id = user_info[0]

            while user_visits[user_id] >= max_visits or current_day > total_days:
                current_day = 1 if current_day > total_days else current_day + 1
                for u_id in user_visits:
                    user_visits[u_id] = 0  # Reset user visits count

            suggested_days[users.index(user_info)] = current_day
            user_visits[user_id] += 1

    return suggested_days

def export_to_csv(users, suggested_days, filename='output_suggested_days.csv'):
    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(['User_ID', 'Territory', 'Sub-Territory', 'Latitude', 'Longitude', 'Place_ID', 'Suggested_Day'])

        for user_info, day in zip(users, suggested_days):
            user_id, territory, sub_territory, latitude, longitude, place_id = user_info
            csvwriter.writerow([user_id, territory, sub_territory, latitude, longitude, place_id, day])

filename = 'test1.csv'
users = read_data(filename)
proximity_threshold = 5000  # Set your desired proximity threshold in meters
total_days = 12  # Set the total number of days for the user to visit all places
suggested_days = assign_suggested_days(users, proximity_threshold, total_days=total_days)
map = create_map_markers(users, suggested_days)
map.save('map_with_suggested_days.html')

export_to_csv(users, suggested_days, 'output_suggested_days.csv')
