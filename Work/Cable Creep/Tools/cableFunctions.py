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

def save_vals(Liste_pos):

    pixel_pos = []
    millimeter_pos = []

    with open("Pixel_vals", "a") as file:
        for k in range(1,len(Liste_pos)):
            pixel_pos.append(initial-Liste_pos[k])
            file.write(str(pixel_pos[k-1])+"\n")

    with open("Millimeter_vals", "a") as file:
        for k in range(1,len(Liste_pos)):
            millimeter_pos.append((initial-Liste_pos[k])*0.0819)  # Converts pixel size to millimetres
            file.write(str(millimeter_pos[k-1])+"\n")

    return [millimeter_pos, pixel_pos]


def show_image(file):
    image=imread(file)
    plt.imshow(image)
    show()


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
            if photo[i][j][0]>0.6 and photo[i][j][2]<0.4 and photo[i][j][1]<0.4:       # Check the RGB values for each pixle in the range
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


def isblack(photo):

    size = photo.shape

    X = size[1]
    Y = size[0]
    randl = 5
    xrand = random.sample(range(0,X),randl)
    yrand = random.sample(range(0,Y),randl)

    pixels = np.zeros(randl)
    for i in range(0,randl):
        pixels[i] = photo[yrand[i]][xrand[i]][0]

    avg = statistics.mean(pixels)
    if(avg > 0.45):
        return 0
    else:
        return 1


def getTimeList():

    Time = []
    path = "."
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


def getTimeCSV(file):
    Time = []
    with open(file) as csv_file:
        csv_reader=csv.reader(csv_file)
        for row in csv_reader:
            Time.append(int(row[0]))

    return Time


def extrapolate(mval, pics, r1, r2, end):

    X_range = [r1, r2]

    section_mm = mval[X_range[0]:X_range[1]:1]
    section_time = pics[X_range[0]:X_range[1]:1]

    m, b = np.polyfit(section_time, section_mm, 1)

    section_time = np.linspace(r1,end,100)
    new = np.multiply(m,section_time) + b

    return [section_time, new]





