#!/usr/bin/env python

import urllib2
import sre
import zipfile

url = "http://www.pythonchallenge.com/pc/hex/unreal.jpg"
auth_handler = urllib2.HTTPBasicAuthHandler()
auth_handler.add_password('pluses and minuses', 'www.pythonchallenge.com', 'butter', 'fly')
opener = urllib2.build_opener(auth_handler)
regex = sre.compile("bytes (\d)+-(\d+)/\d+")

# your new nickname is "invader"
def getnickname():
    nextrange = 0
    while True:
        req = urllib2.Request(url)
        req.headers['Range'] = "bytes=%d-"%nextrange
        print req.headers['Range']
        c = opener.open(req)
        nextrange = int(sre.match(regex, c.headers['content-range']).groups()[1]) + 1
        print c.headers['content-range']
        f = open("level20.out","w")
        for data in c.read():
            f.write(data)



# tells you the password is your new nickname in reverse
# and that "it" is hidden at 1152983631
def getpassword():
    nextrange = 2123456789
    while True:
        req = urllib2.Request(url)
        req.headers['Range'] = "bytes=%d-"%nextrange
        print req.headers['Range']
        c = opener.open(req)
        nextrange = int(sre.match(regex, c.headers['content-range']).groups()[0]) - 1
        print c.headers['content-range']
        f = open("level20.out","w")
        for data in c.read():
            f.write(data)

# gets "it", which turns out to be a zip file
def getzip():
    nextrange = 1152983631
    req = urllib2.Request(url)
    req.headers['Range'] = "bytes=%d-"%nextrange
    print req.headers['Range']
    c = opener.open(req)
    print c.headers['content-range']
    f = open("level20.out","w")
    for data in c.read():
        f.write(data)
    f.close()
    return "level20.out"


# so you get level20.out, which is a zip file, with a password ("redavni")
getzip()

