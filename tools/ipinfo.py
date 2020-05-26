#!/usr/bin/env python3

import sys
import requests
import json

ip = sys.argv[1]

#API_URL = "http://ip-api.com/json/%s"%ip
API_URL = "http://ip-api.com/json/%s"%ip

#p = { 'lang': 'zh-CN' }
#r = requests.get( API_URL, params=p )

r = requests.get( API_URL ).text
info = json.loads(r)

#for k in info.keys():
#    print( "%s: %s"%(k, info[k]) )

if 'message' in info.keys():
    print( info['message'] )
    exit()

s = '%s %s\n%s\n%s'%(info['country'],
                   info['city'], 
                   '.'.join(info['isp'].split()),
                   '.'.join(info['org'].split()),
                   )
print( s )
