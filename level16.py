from PIL import Image
wire = Image.open("mozart.gif")



def straighten(img):
    newimg = Image.new("P", (640,480), None)
    newimg.putpalette(img.getpalette())
    for y in range(480):
        for x in range(640):
            if img.getpixel((x,y)) == 195:
                for i in range(640):
                    newimg.putpixel((i,y), img.getpixel(((x + i) % 640,y)))
                break
    return newimg


