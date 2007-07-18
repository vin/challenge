import zipfile
import sre

comments = ""
z = zipfile.ZipFile(open("channel.zip"))
text = z.read("90052.txt")
while text:
    print text
    text = sre.sub("Next nothing is ", "", text)
    try:
        comments += z.getinfo(text + ".txt").comment
        text = z.read(text + ".txt")
    except KeyError:
        print comments
