#!/usr/bin/python3
"""
queries the Reddit API and returns the number of subscribers
"""
import requests


def number_of_subscribers(subreddit):
    """ Get number of subscribers """
    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)
    try:
        r = requests.get(url, headers={"User-Agent": "subscribers/1.0"},
                         allow_redirects=False)
        if r.status_code >= 300:
            return 0
        response = r.json()
        return response.get("data").get("subscribers")
    except Exception:
        return 0
