#!/usr/bin/env python

import mimetools
fin = open("level19.in")
fout = open("level19.out","w")
mimetools.decode(fin, fout, "base64")
