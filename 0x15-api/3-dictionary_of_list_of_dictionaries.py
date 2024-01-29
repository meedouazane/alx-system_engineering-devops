#!/usr/bin/python3
''' information about his/her TODO list progress '''
import json
import requests


if __name__ == "__main__":
    r1 = requests.get('https://jsonplaceholder.typicode.com/todos/')
    todo = r1.json()
    r2 = requests.get('https://jsonplaceholder.typicode.com/users')
    user = r2.json()
    row = []
    dict1 = {}
    dict2 = {}
    for j in user:
        row = []
        for i in todo:
            if j['id'] == i['userId']:
                dict2['username'] = j['username']
                dict2['task'] = i['title']
                dict2['completed'] = i['completed']
                row.append(dict2)
        dict1[j['id']] = row
    path = 'todo_all_employees.json'
    with open(path,  "w") as jsonfile:
        data = json.dumps(dict1)
        jsonfile.write(data)
