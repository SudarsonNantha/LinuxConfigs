import math
import numpy as np
import matplotlib.pyplot as plt

def getApprox1D(U,K,qN,r,isBitmat = 0):
    N = getSize(len(U))
    u = np.zeros(N)


    U = np.sort(U)
    p = np.zeros(N)
    L = 1

    u = U[N-1:N*N-N:N]

    u = np.insert(u,0,0,axis=0)
    for i in range(0,len(u)):
        print('U[%i]= %f\n'%(i+1,u[i]))
    x = np.linspace(-L,L,N)

    print(u)
    if isBitmat == 1:
        K1 = K[0]
        K2 = K[1]
        N = int(N/2)+1
        p1 = uFunBimat_1(np.linspace(-L,0,N),K1,qN,r,L)
        p2 = uFunBimat_2(np.linspace(0,L,N), K2,qN,r,L,p1[-1])
        p2 = np.delete(p2,0)
        p   = np.concatenate((p1,p2),axis=0)
        print(p1)
        print(p2)
        print(p)
    else:
        K1 = K[0]
        p = uFunSquare(np.linspace(-L,L,N),K1,qN,r,L)

    return x, u, p

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

def FD_getMaxError(U):
    N = getSize(len(U))
    U = np.sort(U)
    L = 1

    Uex = FDExact(L,N)
    Uex = Uex.flatten()

    U = np.sort(U)
    Uex = np.sort(Uex)

    c = 2*N+2*(N-2)
    max = 0
    for i in range(0,N*N):
#        print('%i: %g - %g\n'%(i,U[i],Uex[i]))
        temp = abs(U[i] - Uex[i])
        if temp > max:
            max = temp
    print('N = %i, Error = %g\n'%(N,max))

    return max, N

def getSize(c):
    a = 1
    b = -1
    c = -c
    d = b**2 - 4*a*c
    size = (-b+math.sqrt(d))/2*a
    return int(size)

def uFunSquare(x,K,qN,r,L):
    return -(r*x**2/(2*K)) + (qN + r*L)*x/K + 3*r*L**2/(2*K) + qN*L/K

def uFunBimat_1(x,K,qN,r,L):
    return -(r*x**2/(2*K)) + qN*x/K + r*L**2/(2*K) + qN*L/K

def uFunBimat_2(x,K,qN,r,L,prev):
    return -(r*x**2/(2*K)) + (qN + r*L)*x/K + prev


    return xex, uex
def getExactSoln_Square(K,qN,r):
    n = 100
    L = 1
    K1 = K[0]
    xex = np.linspace(-L,L,n)
    uex = uFunSquare(xex,K1,qN,r,L)
    return xex, uex

def getExactSoln_Bimat(K,qN,r):
    n = 100
    L = 1
    K1 = K[0]
    K2 = K[1]

    x1 = np.linspace(-L,0,n)
    x2 = np.linspace(0,L,n)
    u1 = uFunBimat_1(x1,K1,qN,r,L)
    u2 = uFunBimat_2(x2,K2,qN,r,L,u1[-1])
    u2 = np.delete(u2,0)

    uex = np.concatenate((u1,u2),axis=0)
    xex = np.concatenate((x1,x2),axis=0)
    return xex, uex

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

"""
