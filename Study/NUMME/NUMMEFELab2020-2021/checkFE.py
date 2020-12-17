import math
import numpy as np
import matplotlib.pyplot as plt

# This function sorts the values of U
# and extracts 1D values from it
def getApprox1D(U,K,qN,r,isBitmat = 0):
    N = getSize(len(U))
    u = np.zeros(N)     # Stores the 1D values
    U = np.sort(U)      # Sort U values
    p = np.zeros(N)     # Exact values for 1D nodes
    L = 1               # Size of the boundary from -1 to 1

    u = U[N-1:N*N-N:N]  # Extract 1D values

    u = np.insert(u,0,0,axis=0)
#    for i in range(0,len(u)):
#        print('U[%i]= %f\n'%(i+1,u[i]))

    x = np.linspace(-L,L,N)

    # Two different PDEs need to be used in the case of two isotropic materials
    if isBitmat == 1:
        K1 = K[0]
        K2 = K[1]
        N = int(N/2)+1
        p1 = uFun(np.linspace(-L,0,N),K1,qN,r,L,case=1)
        p2 = uFun(np.linspace(0,L,N), K2,qN,r,L,prev=p1[-1],case=2)
        p2 = np.delete(p2,0)
        p   = np.concatenate((p1,p2),axis=0)

    # Use standard PDE for single material
    else:
        K1 = K[0]
        p = uFun(np.linspace(-L,L,N),K1,qN,r,L,case=0)

    return x, u, p

# Returns exact FD values for a given NxN mesh size
# Taken from FD Lab script
def FDExact(L,n):
    U = np.zeros((n,n))
    N = 5
    X = np.linspace(-L,L,n)
    Y = np.linspace(-L,L,n)
    for p in range(0,n):
        for q in range(0,n):
            x = X[p]
            y = Y[q]
            out = 0
            for i in range(1,2*N,2):
                for j in range(1,2*N,2):
                    out += (64/(i*j*(i**2+j**2)*math.pi**4)) * math.sin(i*math.pi*(x+1)/2) * math.sin(j*math.pi*(y+1)/2)
                    U[p][q] = out

    return U

# Compares the FEM solution to the Analytical solution
def FD_getMaxError(U):
    N = getSize(len(U))
    U = np.sort(U)
    L = 1

    Uex = FDExact(L,N)      # Stores exact temperature values
    Uex = Uex.flatten()
    U = np.sort(U)          # Sorts U values like in getAprrox1D()
    Uex = np.sort(Uex)

#    c = 2*N+2*(N-2)         # Ignores zeroes
    max = 0
    for i in range(0,N*N):
#        print('%i: %g - %g\n'%(i,U[i],Uex[i]))
        temp = abs(U[i] - Uex[i])
        if temp > max:
            max = temp
    print('N = %i, Error = %g\n'%(N,max))
    return max, N

# Returns size of the mesh given the number of elements
def getSize(c):
    a = 1
    b = -1
    c = -c
    d = b**2 - 4*a*c
    size = (-b+math.sqrt(d))/2*a
    return int(size)

# Returns exact solution based on Square or Bimat
def uFun(y,K,qN,r,L,prev = 0, case = 0):
    out = 0
    if case == 0:   # Normal Square
        out = -(r*y**2/(2*K)) + (qN + r*L)*y/K + 3*r*L**2/(2*K) + qN*L/K
    elif case == 1: # Bimat PDE 1
        out =  r*(L**2-y**2)/(2*K) + qN*(y+L)/K
    elif case == 2: # Bimat PDE 2
        out =  -(r*y**2/(2*K)) + (qN + r*L)*y/K + prev
    return out

# Returns high precision values for Square mesh
def getExactSoln_Square(K,qN,r):
    n = 100
    L = 1
    K1 = K[0]
    xex = np.linspace(-L,L,n)
    uex = uFun(xex,K1,qN,r,L,case=0)
    return xex, uex

# Returns high precision values for Bimat mesh
def getExactSoln_Bimat(K,qN,r):
    n = 100
    L = 1
    K1 = K[0]
    K2 = K[1]

    x1 = np.linspace(-L,0,n)
    x2 = np.linspace(0,L,n)
    u1 = uFun(x1,K1,qN,r,L,case=1)
    u2 = uFun(x2,K2,qN,r,L,prev=u1[-1],case=2)

    uex = np.concatenate((u1,u2),axis=0)
    xex = np.concatenate((x1,x2),axis=0)
    return xex, uex

# Returns max temperature variation
def getTempDiff(U):
    U = np.sort(U)
    p = U[0]
    q = U[len(U)-1]
    print("Difference: %g - %g = %g" %(p,q,abs(p-q)))
    return abs(p-q)

"""
def get1DSoln(U, K, BCN, r, bimate = 0):
    U, N = getTemp(U)
    n = 100
    L = 1

    u = U [:,0]     # Get only ony column
    u = u[::-1]     # Reverse array
    x = np.linspace(-L,L,N)
    p = np.zeros(N)

    p = uFun(x,K,BCN,r,L)
    e = max(abs(p-u))

    if bimat == 1:
        K1 = K[0]
        K2 = K[1]
    else:
        K1 = K[0]
        K2 = K[0]

    p1 = uFun(np.linspace(-L,0,N/2),K1,qN,r,L)
    p2 = uFun(np.linspace(0,L,N/2), K2,qN,r,L)
    p   = np.concatenate((p1,p2),axis=0)

#    print("Approx Solution = ",list(u))
#    print("Exact Solution  = ",list(p))
#    print("Max Error = ",e)

    return u, p

def getTemp(U):
    N = getSize(len(U))
    P = np.zeros((N,N))
    V = N-1
    c = 0

#    for i in range(0,N*N-N):
#        print('U[%i] = %f'%(i+1,U[i]))

    P[0][0] = U[0]
    if V == 0:
        return P, N

    P[0][V] = U[1]
    c+=1

    if V == 1:
        return P, N

    for i in range(V,0,-1):
        P[i-1][V] = U[c+1]
        c+=1

    for i in range(1,V):
        P[0][V-i] = U[c]
        c+=1

    for i in range(1,V):
        P[i][0] = U[c]
        c+=1

    for i in range(1,V):
        for j in range(V-1,0,-1):
            P[j][i] = U[c]
            c+=1

    return P, N

def uFunSquare(y,K,qN,r,L):
    return -(r*y**2/(2*K)) + (qN + r*L)*y/K + 3*r*L**2/(2*K) + qN*L/K

def uFunBimat_1(y,K,qN,r,L):
#    return -(r*y**2/(2*K)) + qN*y/K + r*L**2/(2*K) + qN*L/K
    return r*(L**2-y**2)/(2*K) + qN*(y+L)/K

def uFunBimat_2(y,K,qN,r,L,prev):
    return -(r*y**2/(2*K)) + (qN + r*L)*y/K + prev
"""
