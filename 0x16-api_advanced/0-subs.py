#!/usr/bin/python3
"""
queries the Reddit API and returns the number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """ Get number of subscribers """


    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    r = requests.get(url, headers={"User-Agent": "subscribers/1.0"},
                     allow_redirects=False)
    if r.status_code <= 300:
        response = r.json()
        return response.get("data").get("subscribers")
    else:
        return 0
