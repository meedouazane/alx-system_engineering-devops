#!/usr/bin/python3
"""
queries the Reddit API and returns top 10 hot
"""
import requests


def top_ten(subreddit):
    """  prints the titles of the first 10 hot posts """
    url = "https://www.reddit.com/r/{}/hot.json".format(subreddit)
    r = requests.get(url, headers={"User-Agent": "subscribers/1.0"},
                     allow_redirects=False)
    if r.status_code >= 300:
        print(None)
        return
    response = r.json()
    for i in range(0, 10):
        print(response['data']['children'][i]['data']['title'])
