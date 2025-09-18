import csv
import json
import sys

def csv_to_json(csv_filename, json_filename):
    try:
        with open(csv_filename, 'r', encoding='utf-8') as csv_file:
            csv_reader = csv.DictReader(csv_file)
            data = list(csv_reader)
        
        with open(json_filename, 'w', encoding='utf-8') as json_file:
            json.dump(data, json_file, indent=2, ensure_ascii=False)
        
        print(f"Successfully converted {csv_filename} to {json_filename}")
        print(f"Total records: {len(data)}")
        
    except FileNotFoundError:
        print(f"Error: {csv_filename} not found")
    except Exception as e:
        print(f"Error: {e}")

if __name__ == "__main__":
    csv_to_json('retail_by_country.csv', 'retail_by_country.json')
    csv_to_json('retail_running_total.csv', 'retail_running_total.json')