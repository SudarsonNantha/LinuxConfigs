import numpy as np
import matplotlib.pyplot as plt
from matplotlib.pyplot import *
import time
import csv

input_time = []     # Stores input times
input_v1 = []       # Stores input shaft1 velocity
input_v2 = []       # Stores input shaft2 velocity

### Reads velocity and time data for input shafts
### Second shaft is always at a constant 30 deg/s velocity
with open("input.csv") as csv_file:
    csv_reader=csv.reader(csv_file)
    for row in csv_reader:
        input_time.append(float(row[0]))
        input_v1.append(float(row[1]))
        input_v2.append(30)

### Reads velocity and time data for output shaft
output_time = []
output_vel = []
with open("output.csv") as csv_file:
    csv_reader=csv.reader(csv_file)
    for row in csv_reader:
        output_time.append(float(row[0]))
        output_vel.append(float(row[1]))

### Plots
plot(input_time,input_v1, '--')
plot(input_time,input_v2, '--')
plot(output_time,output_vel,lw=2)
show()
