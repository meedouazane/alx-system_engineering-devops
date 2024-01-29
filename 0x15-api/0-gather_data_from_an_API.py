#!/usr/bin/python3
''' information about his/her TODO list progress '''
import requests
from sys import argv


if __name__ == "__main__":
    e_id = argv[1]
    r = requests.get(f'https://jsonplaceholder.typicode.com/users/{e_id}')
    response = r.json()
    name = response['name']
    r2 = requests.get(
            f'https://jsonplaceholder.typicode.com/users/{e_id}/todos')
    tasks = r2.json()
    c = 0
    unc = 0
    title = ''
    for i in tasks:
        if i['completed'] is True:
            c += 1
            title += '\n' + '\t ' + i['title']
        else:
            unc += 1
    print(f'Employee {name} is done with tasks({c}/{c + unc}):', end='')
    print(f'{title}')
