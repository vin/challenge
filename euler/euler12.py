#!/usr/bin/env python
#
'''
import Primes
import Data.List

uniq [] = []
uniq [x] = [x]
uniq (x:y:zs) | x == y = uniq (y:zs)
              | otherwise = x:uniq(y:zs)

quads = map (\n -> [n,n+1,n+2,n+3]) [1..]
main = print $ find (all (>=4) . map (length . uniq . factor)) quads
'''


def doit(limit):
    factors = [0]*limit
    for i in xrange(2,limit):
        for m in xrange(i,limit,i):
            factors[m] += 1
        if factors[i] == 500:
            return i
    return factors

print doit(290000)
