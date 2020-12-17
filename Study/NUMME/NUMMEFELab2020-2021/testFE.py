# This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Contact : Gregory LEGRAIN - gregory.legrain@ec-nantes.fr
#

import os
import time
import matplotlib.pyplot as plt
import numpy as np

#Import finite element solver function
from solveFE import solveFE
from checkFE import *

np.set_printoptions(linewidth=300)
np.set_printoptions(precision=3, suppress=True)

start = time.time()

# List to store all the mesh files
meshes = [
            "square1x1.msh",            #0
            "square2x2.msh",            #1
            "square4x4.msh",            #2
            "square10x10.msh",          #3
            "square20x20.msh",          #4
            "square30x30.msh",          #5
            "square40x40.msh",          #6

            "squareHole20.msh",         #7
            "squareHole30.msh",         #8
            "squareHole40.msh",         #9
            "squareHole60.msh",         #10

            "squareBimat4.msh",         #11
            "squareBimat8.msh",         #12
            "squareBimat10.msh",        #13
            "squareBimat20.msh",        #14

            "squareInclusion20.msh",    #15
            "squareInclusion40.msh",    #16

            "circuit0.msh",             #17
            "circuit1.msh",             #18
            "circuit2.msh",             #19
            "circuit3.msh",             #20
          ]

#-------------------------------------------------------#
#          These values control the programme           #
#-------------------------------------------------------#

meshNumber = 2
openMesh = 0
displayU = 0
isFD = 0
plotErrors = 1
showPlot = 1
useSparse = True           # Reduce memory consumption
verboseOutput = False      # Reduce console output

#-------------------------------------------------------#

# Stores the Meshes in seperate lists
square = meshes[:7]
squareHole = meshes[7:11]
bimat = meshes[11:15]
inclusion = meshes[15:17]
circuit = meshes[17:21]

meshName = meshes[meshNumber]

# Sets the case based on chosen mesh
if isFD == 1:
    case = -1
elif meshNumber <=10 and isFD == 0:
    case = 0
elif meshNumber > 10 and meshNumber <= 16:
    case = 1
elif meshNumber > 16 and meshNumber <= 20:
    case = 2


# Assigns Neumann Boundary Conditions
if case == -1:
    BCNs = {103: 0}
else:
    BCNs = {103: 1}
    qN = 1


# Assigns Dirichlet Boundary Conditions
if case == -1:
    BCD_lns = {101: 0, 102: 0, 103: 0, 104: 0}
elif case == 2:
    BCD_lns = {101: 293, 102: 293, 103: 293, 104: 293}
else:
    BCD_lns = {101: 0}
BCD_nds = {1: 0}


# Assings conductivities
K = [3,1,1.38e-3,15e-3]
if case == 0:                                       # Normal square or square hole
    conductivities = {1000: K[0]}
elif case == -1:                                    # FD Problem
    conductivities = {1000: 1}
elif case == 1:                                     # Bimat and Inclusion
    conductivities = {1000: K[0], 2000: K[1]}
elif case == 2:                                     # Circuit
    conductivities = {1000: K[2], 2000: K[3]}


# Assigns source term
if case == -1 or case == 2:
    r = 1
else:
    r = 1
sourceTerm = lambda xyz, physdom: r


# Name of temperature file to be stored
name = meshName[:-4]
exportName = 'outputs/temp' + '-' + name + '.pos'

# Calls function to calculate temperature and export to .pos
if plotErrors == 0:
    U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)

    getTempDiff(U)
    if case == -1:
        FD_getMaxError(U)
    # Open .pos file in Gmsh
    if openMesh == 1:
        cmd = "gmsh " + exportName + " &"
        os.system(cmd)


# Plots errors based on the case
# e stores the maximum error
# a stores the average error
# h = 1/h or the number of nodes
else:

    # Plot the error for the Finite DIFFERENCE problem
    if case == -1:
        newMesh = square
        newMesh = np.delete(newMesh,0)
        newMesh = np.delete(newMesh,0)
        N = len(newMesh)
        e = np.zeros(N)
        h = np.zeros(N)

        for i in range(0,N):
            meshName = newMesh[i]
            U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
            e[i], h[i] = FD_getMaxError(U)

        errFig = plt.figure()
        ax = errFig.add_subplot(111)
        plt.loglog(h,e)
        ax.scatter(h,e,color='black')
        j = 0
        for xy in zip(h, e):
            ax.annotate('  N=%i' % (h[j]+1), xy=xy, textcoords='data')
            j += 1

        plt.xlabel('1/h', fontsize=12)
        plt.ylabel('Error', fontsize=12)
        plt.title("Error Plot - Finite Element Method", fontsize=14)
        plt.grid(b=True, which='major', color='grey', linestyle='-')
        plt.grid(b=True, which='minor', color='lightsteelblue', linestyle='--')
        plt.tight_layout()
        figName = "FD_Error.png"
        plt.savefig(figName, bbox_inches='tight',dpi=300)
        end = time.time()
        cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
        os.system(cmd)
        if showPlot:
            plt.show()

    # Plot error for CIRCUIT
    elif case == 2:
        newMesh = circuit
        N = len(newMesh)
        diff = np.zeros(N)

        for i in range(0,N):
            U = solveFE(newMesh[i], conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)

            diff[i] = getTempDiff(U)
            print(diff[i])

            if i > 0:
                conv = abs((diff[i]-diff[i-1])/diff[i-1])
                print("Convergence = %g%%"%(conv*100))

        plt.figure()
        plt.plot(newMesh,diff)
        plt.scatter(newMesh,diff)
        plt.ylim([0, 350])
        plt.xlabel('Circuit Mesh', fontsize=12)
        plt.ylabel('Temperature (K)', fontsize=12)
        plt.title("Temperature Variation", fontsize=14)
        plt.grid(b=True, which='major', color='grey', linestyle='-')
        plt.grid(b=True, which='minor', color='lightsteelblue', linestyle='--')
        figName = "Circuit_Temp_Variation.png"
        plt.savefig(figName, bbox_inches='tight', dpi=300)
        cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
        os.system(cmd)
        if showPlot:
            plt.show()

    # Plot error for SQUARE and BIMAT
    else:
        # Finds exact solution based on square or bimat
        isBimat = 0
        if case == 0:
            newMesh = square
            xex, uex = getExactSoln_Square(K,qN,r)
            name = "square"
        if case == 1:
            newMesh = bimat
            isBimat = 1
            xex, uex = getExactSoln_Bimat(K,qN,r)
            name = "bimat"
        print("isBimat = ",isBimat)
        N = len(newMesh)

        # Stores maximum and average error
        e = np.zeros(N)
        a = np.zeros(N)
        h = np.zeros(N)

        # Plot exact solution
        plt.figure()
        plt.plot(xex,uex,label='Exact Solution',linewidth=4,color='black')

        # Find solution and errors for different mesh sizes
        for i in range(0,len(newMesh)):
            meshName = newMesh[i]
            U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
            x, u, v = getApprox1D(U,K,qN,r,isBimat)
            e[i] = max(abs(v-u))
            a[i] = sum(abs(v-u))/len(u)

            print(meshName)
            print('Max Error = %g, Avg Error = %g\n'%(e[i],a[i]))
            plt.plot(x,u, label=newMesh[i])
            h[i] = len(u)

        plt.legend()
        plt.grid()
        plt.xlabel("Position y", fontsize = 12)
        plt.ylabel("Temperature u(y)", fontsize = 12)
        plt.title('FEM Deviations for r = %g'%r)
        figName = "Exact-vs-Approx_r=" + str(r) + "_"+name+".png"
        plt.savefig(figName, bbox_inches='tight', dpi=300)
        cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
        os.system(cmd)

        if showPlot:
            plt.show()

        if case == 0 and r == 0:
            newMesh.pop(0)
            e = np.delete(e,0)
            a = np.delete(a,0)
            h = np.delete(h,0)
        plt.figure()
        for i in range(0,len(newMesh)):
            newMesh[i] = newMesh[i][6:]
            newMesh[i] = newMesh[i][:-4]
        plt.plot(h,e, label='Maximum Error')
        plt.plot(h,a, label='Average Error')
        plt.scatter(h,e)
        plt.scatter(h,a)
        plt.yscale("log")
        plt.xlabel("Mesh Size", fontsize=12)
        plt.ylabel("Error", fontsize=12)
        plt.title('Error for r = %g'%r)
        plt.legend()
        plt.grid()
        figName = "ErrorPlot_r="+str(r)+"_"+name+".png"
        plt.savefig(figName,bbox_inches='tight',dpi=300)
        cmd = "convert "+figName+" "+figName[:-3]+"eps"     # Save as eps file to import into groff document
        os.system(cmd)

        end = time.time()

        if showPlot:
            plt.show()

try:
    end
except NameError:
    end = time.time()
print('\n\nTime Elapsed = %g\n\n'%(end-start))
