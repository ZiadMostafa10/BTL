import pandas as pd

# Load CSV data into a DataFrame with UTF-8 encoding
data = pd.read_csv('Zeyad.csv', encoding='utf-8')

# Sort the DataFrame first by 'Territory', then by 'Sub-Territory', and finally by 'LATITUDE' and 'LONGITUDE'
data_sorted = data.sort_values(by=['Territory', 'Sub-Territory', 'latitude', 'longitude'])

# Initialize variables
team_assignments = {}  # Dictionary to store team assignments for each sub-territory
team_counts = {}  # Dictionary to store counts of places assigned to each team for each sub-territory

# Iterate over each place and assign it to a team for each sub-territory
for idx, place in data_sorted.iterrows():
    sub_territory = place['Sub-Territory']
    
    if sub_territory not in team_assignments:  # If the sub-territory is not assigned to any team yet, create initial assignments
        team_assignments[sub_territory] = {}
        team_counts[sub_territory] = {}
    
    # Get the counts of places assigned to each team for the current sub-territory
    sub_territory_teams = team_assignments[sub_territory]
    sub_territory_team_counts = team_counts[sub_territory]
    
    # Find the team with the fewest assigned places
    min_assigned_team = min(sub_territory_team_counts, key=sub_territory_team_counts.get, default=1)
    if min_assigned_team not in sub_territory_teams:  # If the team doesn't exist for the sub-territory, create it
        sub_territory_teams[min_assigned_team] = []
        sub_territory_team_counts[min_assigned_team] = 0
    
    # If the current team has already 10 places or the sub-territory has less than 10 places, move to the next team
    while sub_territory_team_counts[min_assigned_team] == 7 or len(sub_territory_teams[min_assigned_team]) >= 10:
        min_assigned_team += 1
        if min_assigned_team not in sub_territory_teams:  # If the team doesn't exist for the sub-territory, create it
            sub_territory_teams[min_assigned_team] = []
            sub_territory_team_counts[min_assigned_team] = 0
    
    # Assign the place to the current team
    sub_territory_teams[min_assigned_team].append(place['New Sap Code'])
    sub_territory_team_counts[min_assigned_team] += 1

# Assign team numbers to the places
for sub_territory, sub_territory_teams in team_assignments.items():
    for team_num, places in sub_territory_teams.items():
        for place_id in places:
            data.loc[data['New Sap Code'] == place_id, 'team'] = f'Team {team_num}'

# Write the DataFrame back to CSV with teams assigned
data.to_csv('assigned_teams.csv', index=False, encoding='utf-8')
