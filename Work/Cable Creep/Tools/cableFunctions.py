import imageio
import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import *
from tqdm import tqdm
import time
import csv
import os
import re
import random
import statistics


### Save displacement readings in millimetres and pixels
def calc_vals(Liste_pos,initial,scale):

    pixel_pos = []
    millimeter_pos = []

    for k in range(1,len(Liste_pos)):
        millimeter_pos.append((initial-Liste_pos[k])*scale)  # Converts pixel size to millimetres
        pixel_pos.append(initial-Liste_pos[k])

    return [millimeter_pos, pixel_pos]

def save_vals(millimeter_pos, pixel_pos, Time, path="."):
#    path = "/home/sudarson/Work/Cable Creep/essai16/"

    filepath = path+"mvals.csv"
    if(os.path.exists(filepath)):
        print("File already exists")
        [old_mval, old_pval, old_Time] = getVals(filepath)


        if(len(old_Time) > len(Time)):
            print("Old values larger")
            l = len(old_mval)
            savevalues = np.zeros((l,3))
            [larger_Time, larger_mval, larger_pval, smaller_Time, smaller_mval, smaller_pval] = [old_Time, old_mval, old_pval, Time, millimeter_pos, pixel_pos]
        else:
            print("New values larger")
            l = len(millimeter_pos)
            print(l)
            savevalues = np.zeros((l,3))
            [larger_Time, larger_mval, larger_pval, smaller_Time, smaller_mval, smaller_pval] = [Time, millimeter_pos, pixel_pos, old_Time, old_mval, old_pval]

        savevalues[:,0] = larger_mval
        savevalues[:,1] = larger_pval
        savevalues[:,2] = larger_Time

        print("Checking existing values...\n")
        for i in tqdm(range(0,len(larger_Time))):
            for j in range(0,len(smaller_Time)):
                if(larger_Time[i] == smaller_Time[j]):
                    savevalues[i][0] = smaller_mval[j]
                    savevalues[i][1] = smaller_pval[j]

    else:
        l = len(millimeter_pos)
        savevalues = np.zeros((len(millimeter_pos),3))
        for i in range(0,l):
           savevalues[i][0] = millimeter_pos[i]
           savevalues[i][1] = pixel_pos[i]
           savevalues[i][2] = Time[i]

    print(len(savevalues))
    np.savetxt(os.path.join(path , "mvals.csv"),savevalues,delimiter =", ",fmt ='%s')


### Display an image
def show_image(file):
    image=imread(file)
    plt.imshow(image)
    show()


### Locate and mark the center of scotch tape, then display the image
def find_marker(num, X_range = [0, 2000], Y_range = [0, 1121]):

    photo=imread("image_"+str(num)+".png")
    M=photo.shape            # Stores the size of the photo
    pixel_scotch = [0,0]     # Stores the XY position of centre of the scotch tape
    n=0
    pixels=[]

    [y1, y2] = Y_range
    [x1, x2] = X_range

    for i in range (y1,y2):      # Manually select the Y range to capture the red marking
        for j in range(x1,x2):  # Manually select the X range to capture the red marking
#            if photo[i][j][0]>0.6 and photo[i][j][2]<0.4 and photo[i][j][1]<0.4:       # Check the RGB values for each pixle in the range
#            if photo[i][j][0]>0.4 and photo[i][j][2]<0.2 and photo[i][j][1]<0.2:       # Check the RGB values for each pixle in the range
#            if photo[i][j][0]>0.4 and photo[i][j][2]<0.25 and photo[i][j][1]<0.3:       # Check the RGB values for each pixle in the range
            if photo[i][j][0]>0.3 and photo[i][j][2]<0.25 and photo[i][j][1]<0.3:       # Check the RGB values for each pixle in the range
                pixel_scotch[0]+=i     # Summation of XY values
                pixel_scotch[1]+=j
                photo[i][j]=[1,0,0]
                n+=1
    if n!=0:                       # Division by number of pixels to find mean/centre point if red pixles are detected
        pixel_scotch[0]=int(pixel_scotch[0]/n)
        pixel_scotch[1]=int(pixel_scotch[1]/n)
        photo[pixel_scotch[0],pixel_scotch[1]]=[0,1,0]

    plt.imshow(photo)
    show()

    return pixel_scotch

### Randomly samples parts of the image
### Returns true if image is too dark to be processed
def isblack(photo,X_range = [0,0],Y_range = [10,2000]):

    size = photo.shape

    X = size[1]
    Y = size[0]
    randl = 10
    xrand = random.sample(range(0,X),randl)
    yrand = random.sample(range(0,Y),randl)

    pixels = np.zeros(randl)
    for i in range(0,randl):
        pixels[i] = photo[yrand[i]][xrand[i]][0]

    avg = statistics.mean(pixels)


    n=0
    redpixels = []

    [y1, y2] = Y_range
    [x1, x2] = X_range

    for i in range (y1,y2):      # Manually select the Y range to capture the red marking
        for j in range(x1,x2):  # Manually select the X range to capture the red marking
            if photo[i][j][0]>0.3 and photo[i][j][2]<0.25 and photo[i][j][1]<0.3:       # Check the RGB values for each pixle in the range
                redpixels.append(j)
                n+=1

    if(avg > 0.35 and n == 0):
        return 0
    else:
        return 1

def localIsBlack(photo,X_range = [0,0],Y_range = [10,2000]):
    size = photo.shape

    X = size[1]
    Y = size[0]
    randl = 10
    xrand = random.sample(range(0,X),randl)
    yrand = random.sample(range(0,Y),randl)

    pixels = np.zeros(randl)
    for i in range(0,randl):
        pixels[i] = photo[yrand[i]][xrand[i]][0]

    avg = statistics.mean(pixels)


    n=0
    redpixels = []

    [y1, y2] = Y_range
    [x1, x2] = X_range

    for i in range (y1,y2):      # Manually select the Y range to capture the red marking
        for j in range(x1,x2):  # Manually select the X range to capture the red marking
            if photo[i][j][0]>0.3 and photo[i][j][2]<0.25 and photo[i][j][1]<0.3:       # Check the RGB values for each pixle in the range
                redpixels.append(j)
                n+=1

    if(avg > 0.35 and n == 0):
        return 0
    else:
        return 1


### Returns list of timestamps based on image filename
def getTimeList(path="."):

    Time = []
    filelist=os.listdir(path)
    for fichier in filelist[:]: # filelist[:] makes a copy of filelist.
        if not(fichier.endswith(".png")):
            filelist.remove(fichier)
    images = sorted(filelist)

    for i in range(0,len(images)):
        s = images[i]
        try:
            result = re.search('image_(.*).png',s)
            Time.append(result.group(1))
        except:
            continue

    l = len(Time)
    temp = [None] * l
    for i in range(0,l):
        temp[i] = int(Time[i])

    Time = sorted(temp)
    return Time

### Adjusted for errors
def getAdjustedTimeList(path="."):

    Time = []
    filelist=os.listdir(path)
    for fichier in filelist[:]: # filelist[:] makes a copy of filelist.
        if not(fichier.endswith(".png")):
            filelist.remove(fichier)
    images = sorted(filelist)

    for i in range(0,len(images)):
        s = images[i]
        try:
            result = re.search('image_(.*).png',s)
            Time.append(result.group(1))
        except:
            continue

    l = len(Time)
    temp = [None] * l
    for i in range(0,l):
        if int(Time[i]) < 166:
            temp[i] = int(Time[i]) + 343948
        else:
            temp[i] = int(Time[i])

    Time = sorted(temp)
    return Time

### Returns list of timestamps based on CSV file
def getTimeCSV(file):
    Time = []
    with open(file) as csv_file:
        csv_reader=csv.reader(csv_file)
        for row in csv_reader:
            Time.append(int(row[0]))

    return Time

def getVals(file):
    mval = []
    pval = []
    Time = []
    with open(file) as csv_file:
        csv_reader=csv.reader(csv_file)
        for row in csv_reader:
            mval.append(float(row[0]))
            pval.append(float(row[1]))
            Time.append(float(row[2]))

    return [mval, pval,Time]

### Extrapolates the linear equation from 0 to given value "r3"
def extrapolate(Time, mval, r1, r2, r3):

    inc = 50

    for i in range(0,len(Time)):
        if Time[i] > r1 - inc and Time[i] < r1 + inc:
            a1 = i
        if Time[i] > r2 - inc and Time[i] < r2 + inc:
            a2 = i
        if Time[i] > r3 - inc and Time[i] < r3 + inc:
            a3 = i

    section_mm = mval[a1:a2:1]
    section_time = np.linspace(Time[a1],Time[a2],len(section_mm))

    m, b = np.polyfit(section_time, section_mm, 1)

    section_time = np.linspace(r1,r2,5000)
    section_mm = np.multiply(m,section_time) + b

    extra_time = np.linspace(0,r3,5000)
    extra_mm = np.multiply(m,extra_time) + b

    return [section_time, section_mm, extra_time, extra_mm]

def getmm(Time,mval,target_time):

    target_mm = 0
    for i in range(0,len(Time)):
        inc = 32
        for j in range(0,5):
            if(target_time > Time[i]-inc and target_time < Time[i]+inc):
                target_mm = mval[i]
            inc = inc/2

    return target_mm

def getIndex(Time,target_time):

    index = 0
    for i in range(0,len(Time)):
        inc = 32
        for j in range(0,5):
            if(target_time > Time[i]-inc and target_time < Time[i]+inc):
                index = i
            inc = inc/2

    return index

