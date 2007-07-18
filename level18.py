import gzip
import sre
import binascii
import difflib

f = gzip.GzipFile("deltas.gz")
left = []
right = []
for line in f.readlines():
    (a,b) = sre.match("^(.{53})   (.*)", line).groups()
    left.append(a.strip() + "\n")
    right.append(b.strip() + "\n")

streams = {}

for line in difflib.ndiff(left,right):
    key = line[0]
    if not streams.has_key(key):
        streams[key] = open("level18%s.out"%key, "w")
    data = binascii.unhexlify(sre.sub("[ \n]","",line[2:]))
    if len(data) > 0:
        streams[key].write(data)

for key in streams.keys():
    print streams[key].name
    streams[key].close()
