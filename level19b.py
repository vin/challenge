import wave
import array

fin = wave.open("level19.out")
fout = wave.open("level19.invert","w")

fout.setparams(fin.getparams())

frames = fin.readframes(fin.getnframes())
frame = array.array('H', frames)
frame.byteswap()
fout.writeframes(frame.tostring())

fout.close()
