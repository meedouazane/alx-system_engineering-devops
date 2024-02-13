#!/usr/bin/python3
"""
list containing the titles of all hot articles for a given subreddit
"""
import requests


def recurse(subreddit, hot_list=[], i=0):
    """  prints the titles of the first 10 hot posts """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    r = requests.get(url, headers={"User-Agent": "subscribers/1.0"},
                     allow_redirects=False)
    if r.status_code >= 300:
        return
    response = r.json()
    title = response['data']['children'][i]['data']['title']
    hot_list.append(title)
    i = i + 1
    if i == len(response['data']['children']) - 1:
        return hot_list
    return recurse(subreddit, hot_list, i)
