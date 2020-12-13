import numpy as np

np.set_printoptions(suppress=True)
# Coordinates are in [x,y,z] format
# Represent x and y coordinates in vandermonde form without z coordinates
#   [1 xk yk]
#   [1 xl yl]
#   [1 xm ym]
# The find values of c using [coordinate matrix]*[c] = [f]
#                         => [c] = [coorindate matrix]^-1 * [f]
def getConstants(xyz,N):
    coordinateMatrix = np.ones((N,N))
    c = np.zeros((N,N))
    f = np.eye(N)

    coordinateMatrix[:,1] = xyz[:,0]
    coordinateMatrix[:,2] = xyz[:,1]

    # Find all c values, solution stored row-wise
    inverseMat = np.linalg.inv(coordinateMatrix)
    for i in range (0,N):
        c[i] = np.matmul(inverseMat,f[i])

    # Transpose c so the solutions for equations are along columns (not rows)
    c = np.transpose(c)
    return c

# Find area of element using xyzVerts coordinates
def getArea(xyz):
    xyz[:,2] = 1
    area = 0.5*abs(np.linalg.det(xyz))
    return area

# TODO
# Computation of the elementary stiffness matrix Ke
# xyzVerts (INPUT): Coordinates of the nodes of the element (3x3 numpy array)
# conductivity (INPUT): Conductivity on the current element (scalar number)
# Ke (OUTPUT): Elementary stiffness matrix (3x3 numpy array)
def computeKe(xyzVerts, conductivity):
    N = 3
    c = getConstants(xyzVerts,N)

    # To find gradient of  N(x) = c0 + c1*x + c2*y
    # Be = d/dx N(x) + d/dy N(y)
    # Be is a 2x3 matrix because derivative of c0 = 0
    Be = np.zeros((2,3))
    Be[0,:] = c[1,:]
    Be[1,:] = c[2,:]

    # Calculate elemental conductivity
    # Ke = Int (Te) [ Be^T K Be ]
    # Ke = K * Se * Be^T . Be
    Ke = conductivity * getArea(xyzVerts) * np.matmul(np.transpose(Be),Be)

    return Ke

# TODO
# Computation of the elementary volume force vector Fve (source term effects)
# xyzVerts (INPUT): Coordinates of the nodes of the element (3x3 numpy array)
# sourceTerm (INPUT): Source term evaluator.
# physElt (INPUT): physical id of the current element (integer)
# Fe (OUTPUT): Elementary force vector (3 components numpy array)
#
#
# NOTE: The evaluator is a function of two variables: (xyz, physElt).
# xyz = numpy array containing the coordinates of the evaluation point
# physElt = physical id of the current element (integer)
def computeFve(xyzVerts, sourceTerm, physElt):

    N = 3
    c = getConstants(xyzVerts,N)
    area = getArea(xyzVerts)

    Fve = np.zeros(N)
    one = np.ones(N)

    # Fve = Int (Te) r * [Ne] dOmeg = Int (Te) 1a
    # Fve = r * Int (Te) [ Nk , Nl , Nm] = Area
    # But Nk = Nl = Nm
    # => Fve = r * Area / 3
    Fve = sourceTerm(xyzVerts,physElt) * area * one / 3

    return Fve

# TODO
# Computation of the elementary Neumann force vector FNe
# xyzVerts (INPUT): Coordinates of the nodes of the edge (2x3 numpy array)
# flux (INPUT): Value of the prescribed flux on the current edge (scalar number)
# FNe (OUTPUT): Elementary force vector (2 components numpy array)
def computeFNe(xyzVerts, flux):

#    print("Coordinates = \n",xyzVerts)

    x1 = xyzVerts[0][0]
    x2 = xyzVerts[1][0]
    y1 = xyzVerts[0][1]
    y2 = xyzVerts[1][1]

    Le = np.sqrt( (x2-x1)**2 + (y2-y1)**2)

    FNe = [flux*Le/2, flux*Le/2]

    return FNe

#Test coordinates with tips from pdf
#coordinates =  np.array([[0,0,0],
#                [1,0,0],
#                [0,1,0]])
#print("Ke = \n", computeKe(coordinates,1))
