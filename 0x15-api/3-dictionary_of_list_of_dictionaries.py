#!/usr/bin/python3
''' information about his/her TODO list progress '''
import json
import requests


if __name__ == "__main__":
    r0 = requests.get(
                'https://jsonplaceholder.typicode.com/users')
    re = r0.json()
    for e_id in range(1, len(re) + 1):
        r = requests.get(
                f'https://jsonplaceholder.typicode.com/users/{e_id}')
        response = r.json()
        username = response['username']
        r2 = requests.get(
                f'https://jsonplaceholder.typicode.com/users/{e_id}/todos')
        tasks = r2.json()
        path = 'todo_all_employees.json.csv'
        user_data = {
            e_id: [
                {"username": username, "task": i['title'],
                 "completed": i['completed']}
                for i in tasks
                ]
            }
        with open(path, 'a', newline='') as jsonfile:
            json.dump(user_data, jsonfile)
