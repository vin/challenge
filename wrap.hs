wrap 0 = 1
wrap n = div n 2 + 1

wrapSeq = 1:(map wrap [0..])
