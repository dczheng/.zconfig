#!/usr/bin/env python3
import json
from urllib import request, parse
import sys
 

if len(sys.argv) < 2:
    print( "Please input a text!" )
    exit()

content = sys.argv[1]
url='http://fanyi.youdao.com/translate?smartresult=dict&smartresult=rule&sessionFrom=http://fanyi.youdao.com/'
data = {  
    'i': content, \
    'from': 'AUTO', \
    'to': 'AUTO', \
    'smartresult': 'dict', \
    'client': 'fanyideskweb', \
    'doctype': 'json', \
    'version': '2.1', \
    'keyfrom': 'fanyi.web', \
    'action': 'FY_BY_CLICKBUTTION', \
    'typoResult': 'false' }

data=parse.urlencode(data).encode('utf-8')
response=request.urlopen(url,data)
html=response.read().decode('utf-8')
target=json.loads(html)
print( "%s --> %s"%(content, target['translateResult'][0][0]['tgt']) )
