#!/usr/bin/env python

from datetime import *

firstSundays = 0
cur = date(1901,1,6)
d = timedelta(days=7)
while cur.year < 2001:
    if (cur.day == 1):
        firstSundays += 1
    cur = cur + d

print firstSundays
