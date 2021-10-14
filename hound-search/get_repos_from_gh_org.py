#!/usr/bin/python3
import requests
import json

org = "osism"

configmap = {
  "dbpath": "db",
  "title": "OSISM repo search",
  "repos": {},
  "vcs-config": {
    "git": {
      "detect-ref": True
    }
  }
}

for items in requests.get('https://api.github.com/orgs/%s/repos' % org).json():
  helper = "https://github.com/%s/%s.git" % (org, items['name'])
  configmap['repos'][items['name']] = {
    "url": helper
  }

print(json.dumps(configmap))
