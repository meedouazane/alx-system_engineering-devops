#!/usr/bin/python3
''' information about his/her TODO list progress '''
from sys import argv
import json
import requests

if __name__ == "__main__":
    e_id = argv[1]
    r = requests.get(
            f'https://jsonplaceholder.typicode.com/users/{e_id}')
    response = r.json()
    username = response['username']
    r2 = requests.get(
            f'https://jsonplaceholder.typicode.com/users/{e_id}/todos')
    tasks = r2.json()
    path = f'{e_id}.json'
    user_data = {
        e_id: [
            {"task": i['title'], "completed": i['completed'],
             "username": username}
            for i in tasks
        ]
    }
    with open(path, 'w', newline='') as jsonfile:
        json.dump(user_data, jsonfile)
