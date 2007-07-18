#!/usr/bin/env python
import urllib
import urllib2
import sre

result=""
url="http://pythonchallenge.com/pc/def/linkedlist.php?busynothing=%s"
busynothing="12345"

while True:
    c = urllib2.urlopen(url%busynothing)
    cookie = c.headers['set-cookie']
    m = sre.match(r'info=([^;]+); .*', cookie)
    print cookie
    if m:
        result += urllib.unquote_plus(m.group(1))
    body = c.read()
    m = sre.match(r'.* next busynothing is (\d+)', body)
    if m:
        busynothing=m.group(1)
        print busynothing
    else:
        print body
        break

import bz2
result = bz2.decompress(result)

message="the flowers are on their way"

import xmlrpclib
server = xmlrpclib.Server("http://pythonchallenge.com/pc/phonebook.php")
print server.phone("Leopold")

url = "http://pythonchallenge.com/pc/stuff/violin.php"
request = urllib2.Request(url)
request.headers['Cookie'] = urllib.quote_plus(message)
c = urllib2.build_opener().open(request)
c.read()
c.close()
