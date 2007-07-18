#!/usr/bin/env python
import urllib
import urllib2

message="the flowers are on their way"

#import xmlrpclib
#server = xmlrpclib.Server("http://pythonchallenge.com/pc/phonebook.php")
#print server.phone("Leopold")

url = "http://pythonchallenge.com/pc/stuff/violin.php"
request = urllib2.Request(url)
request.headers['Cookie'] = "info=" + message
c = urllib2.build_opener().open(request)
print c.headers.dict
print c.read()
c.close()
