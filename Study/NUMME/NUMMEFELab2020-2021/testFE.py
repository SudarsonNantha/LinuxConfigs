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
import matplotlib.pyplot as plt
import numpy as np

#Import finite element solver function
from solveFE import solveFE
from checkFE import *

np.set_printoptions(linewidth=300)
np.set_printoptions(precision=3, suppress=True)

#Mesh file
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
meshNumber = 2
openMesh = 1
displayU = 0
isFD = 0
plotErrors = 1
useSparse = False           # useSparse = True if you experience memory issues
verboseOutput = False       # verboseOutput = False if you want minimal verbosity

square = meshes[:7]
squareHole = meshes[7:11]
bimat = meshes[11:15]
inclusion = meshes[15:17]
circuit = meshes[17:21]

meshName = meshes[meshNumber]

if isFD == 1:
    case = -1
elif meshNumber <=10 and isFD == 0:
    case = 0
elif meshNumber > 10 and meshNumber <= 16:
    case = 1
elif meshNumber > 16 and meshNumber <= 20:
    case = 2

if case == -1:               # Neumann Boundary Condition
    BCNs = {103: 0}
else:
    BCNs = {103: 1}
    qN = 1

if case == -1:               # Dirichlet Boundary Condition
    BCD_lns = {101: 0, 102: 0, 103: 0, 104: 0}
elif case == 2:
    BCD_lns = {101: 293, 102: 293, 103: 293, 104: 293}
else:
    BCD_lns = {101: 0}

BCD_nds = {1: 0}

K = [3,10,1.38e-3,1510e-3]
if case == 0:                                       # Normal square or square hole
    conductivities = {1000: K[0]}
elif case == -1:                                    # FD Problem
    conductivities = {1000: 1}
elif case == 1:                                     # Bimat and Inclusion
    conductivities = {1000: K[0], 2000: K[1]}
elif case == 2:                                     # Circuit
    conductivities = {1000: K[2], 2000: K[3]}

#sourceTerm = lambda xyz, physdom: 0.
if case == -1 or case == 2:
    r = 1
else:
    r = 1

sourceTerm = lambda xyz, physdom: r

# Name of temperature file to be stored
name = meshName[:-4]
exportName = 'outputs/temp' + '-' + name + '.pos'


if plotErrors == 0:
    U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
    print(U)
    # Open export .pos file in Gmsh
    if openMesh == 1:
        cmd = "gmsh " + exportName + " &"
        os.system(cmd)

# Plot errors if file is normal square
else:
    isBimat = 0
    if case == 0:
        newMesh = square
        xex, uex = getExactSoln_Square(K,qN,r)
    if case == 1:
        newMesh = bimat
        isBimat = 1
        xex, uex = getExactSoln_Bimat(K,qN,r)
    print("isBimat = ",isBimat)
    if case == 0:
        newMesh.pop(0)
    N = len(newMesh)
    e = np.zeros(N)
    a = np.zeros(N)

    plt.figure()
    plt.plot(xex,uex,label='Exact Solution',linewidth=3,color='black')
    for i in range(0,len(newMesh)):
        meshName = newMesh[i]
        U = solveFE(meshName, conductivities, BCNs, BCD_lns, BCD_nds, sourceTerm, exportName, useSparse, verboseOutput)
        x, u, v = getApprox1D(U,K,qN,r,isBimat)
        e[i] = max(abs(v-u))
        a[i] = sum(abs(v-u))/len(u)

        print(meshName)
        print('Max Error = %g, Avg Error = %g\n'%(e[i],a[i]))

        plt.plot(x,u, label=newMesh[i])

    plt.legend()
    plt.grid()
    plt.savefig('Exact-vs-Approx_r=%g.png'%r)
    plt.show()

    plt.figure(num=None, figsize=(8, 6), dpi=80, facecolor='w', edgecolor='k')
    #plt.figure()
    plt.plot(newMesh,e, label='Maximum Error')
    plt.plot(newMesh,a, label='Average Error')
    plt.scatter(newMesh,e)
    plt.scatter(newMesh,a)
    plt.yscale("log")
    plt.xlabel("Meshes")
    plt.ylabel("Error")
    plt.legend()
    plt.grid()
    plt.savefig('ErrorPlot_r=%g.png'%r)
    plt.show()

