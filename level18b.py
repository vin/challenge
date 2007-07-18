import gzip
import sre
import binascii

d1 = open("d1.txt")
aout = open("18a.out", "w")
for line in d1.readlines():
    print sre.sub("[ \n]","",line)
    aout.write(binascii.unhexlify(sre.sub("[ \n]","",line)))

d2 = open("d2.txt")
bout = open("18b.out", "w")
for line in d2.readlines():
    bout.write(binascii.unhexlify(sre.sub("[ \n]","",line)))
