#!/usr/bin/env python3

import sys
import urllib.request
import requests

ip = sys.argv[1]

API_URL = "https://ipinfo.io"

headers = {
    "user-agent": "IPinfoClient/Python{version}/2.0.0".format(
        version=sys.version_info[0]
    ),
    "accept": "application/json",
}

req = requests.get( "%s/%s"%(API_URL, ip), headers=headers )

print( req.json() )
