#!/usr/bin/python3
''' information about his/her TODO list progress '''
import requests
from sys import argv
import csv

if __name__ == "__main__":
    e_id = argv[1]
    r = requests.get(
            f'https://jsonplaceholder.typicode.com/users/{e_id}')
    response = r.json()
    username = response['username']
    r2 = requests.get(
            f'https://jsonplaceholder.typicode.com/users/{e_id}/todos')
    tasks = r2.json()
    path = f'{e_id}.csv'
    with open(path, 'w', newline='') as csvfile:
        writer = csv.writer(csvfile, quoting=csv.QUOTE_ALL)
        for i in tasks:
            title = i['title']
            com = i['completed']
            writer.writerow([e_id, username, com, title])
