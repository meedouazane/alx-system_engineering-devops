#!/usr/bin/python3
"""
 prints a sorted count of given keywords
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


def count_words(subreddit, word_list, t=0):
    """  prints a sorted count of given keywords """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    r = requests.get(url, headers={"User-Agent": "subscribers/1.0"},
                     allow_redirects=False)
    if r.status_code >= 300:
        return
    hot_list = []
    list_h = recurse(subreddit, hot_list, i=0)
    count = 0
    for item in list_h:
        if word_list[t].lower() in item.lower():
            count += 1
    if count != 0:
        print(f"{word_list[t]} : {count}")
    t = t + 1
    if t != len(word_list):
        return count_words(subreddit, word_list, t)
