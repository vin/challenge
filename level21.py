#!/usr/bin/env python

import zlib

f = open("package.pack")
data = ""

while True:
    d = f.read()
    if len(d) == 0:
        break
    data += d
f.close()

logs = ""
last = ''
while True:
    if data[0] == 'B':
        data = data.decode('bz2')
        last = 'B'
    elif data[0] == 'x':
        data = data.decode('zlib')
        last = 'z'
    else:
        if last == 'r':
            break
        data = data[::-1]
        print logs
        logs = ""
        last = 'r'
    logs += last

print logs

out = open("level21.out","w")
out.write(data)
out.close()
