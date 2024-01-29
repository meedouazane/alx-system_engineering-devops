#!/usr/bin/python3
''' information about his/her TODO list progress '''
import json
import requests


if __name__ == "__main__":
    response = requests.get('https://jsonplaceholder.typicode.com/todos/')
    todo = response.json()

    row = []
    response2 = requests.get('https://jsonplaceholder.typicode.com/users')
    user = response2.json()

    new_dict1 = {}

    for j in user:

        row = []
        for i in todo:

            new_dict2 = {}

            if j['id'] == i['userId']:
                new_dict2['username'] = j['username']
                new_dict2['task'] = i['title']
                new_dict2['completed'] = i['completed']
                row.append(new_dict2)

        new_dict1[j['id']] = row
    path = 'todo_all_employees.json'
    with open(path,  "w") as jsonfile:
        json_obj = json.dumps(new_dict1)
        jsonfile.write(json_obj)
