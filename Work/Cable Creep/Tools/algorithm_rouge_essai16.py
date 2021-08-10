##IMPORT
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

import sys
# sys.path is a list of absolute path strings
sys.path.append('/home/sudarson/Work/Cable Creep/Tools/')
from cableFunctions import*

def scan_images(l):

    [y1, y2] = Y_range
    [x1, x2] = X_range

    incx = 30
    incy = 30

    l1 = 0
    l2 = l

    ### IMAGES
    print("Analysing %g images...\n" %(l2-l1))
    Liste_pos=[initial]
    for k in tqdm(range (l1,l2)):
    #for k in range(2,l):
        input_filename = "image_"+str(Time[k])+".png"
        photo = imread(input_filename)
        M=photo.shape            # Stores the size of the photo
        pixel_scotch = [0,0]     # Stores the XY position of centre of the scotch tape
        n=0
        pixels=[]

        if(isblack(photo)):
            Liste_pos.append(Liste_pos[len(Liste_pos)-1])
            with open("Rejected","a") as file:
                file.write(input_filename+" rejected\n")
            continue

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
            Liste_pos.append(pixel_scotch[1])

            #print("Pixel location = [%g,%g]" %(pixel_scotch[0],pixel_scotch[1]))
            x1 = pixel_scotch[1]-incx
            x2 = pixel_scotch[1]+incx
            y1 = pixel_scotch[0]-incy
            y2 = pixel_scotch[0]+incy

        else:                          # If no red pixels detected, store the last value
            Liste_pos.append(Liste_pos[len(Liste_pos)-1])
            [x1, x2] = X_range
            [y1, y2] = Y_range
#            k = k-1

    return Liste_pos



start = time.time()

Y_range = [500,900]
X_range = [10,2000]
initial = 1877

#show_image(2)
#show_image(50, X_range, Y_range)


#Time = getTimeCSV("Temps.csv")
Time = getTimeList()

#show_image("scale_photo_essai16.png")


#Liste_pos = scan_images(l)
#[millimeter_pos, pixel_pos] = save_vals(Liste_pos)
#end = time.time()
#print("Time elapsed = %g\n" %(end-start))
#plt.plot(millimeter_pos)
#show()

