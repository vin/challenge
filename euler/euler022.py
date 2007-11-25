fn="sortednames.txt"
score = 0
lineNum = 1
for line in open(fn):
    score += sum(map(lambda x: ord(x) - ord('A') + 1, line[:-1])) * lineNum
    lineNum += 1
print score


