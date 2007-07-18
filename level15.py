from PIL import Image
sticks = [n/2 for n in range(200,1,-1)] + [1]
wire = Image.open("wire.png")



def wrapImage(wire):
    wiredata = wire.getdata()
    wrapped = Image.new("RGB", (100,100), None)
    offset = 0
    for i in range(100, 50, -1):
        for x in range(100-i,i):
            wrapped.putpixel((x, 100-i), wiredata[offset])
            offset += 1
        for y in range(101-i,i):
            wrapped.putpixel((i-1, y), wiredata[offset])
            offset += 1
        for x in range(i-2,99-i,-1):
            wrapped.putpixel((x, i-1), wiredata[offset])
            offset += 1
        for y in range(i-2,100-i,-1):
            wrapped.putpixel((100-i, y), wiredata[offset])
            offset += 1
    return wrapped


