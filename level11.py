#!/usr/bin/python

from PIL import Image
cave = Image.open("cave.jpg")
d = cave.getdata()
even = []
odd = []
i = True
for x in d:
    if i:
        even.append(x)
        i = False
    else:
        odd.append(x)
        i = True
