#!/usr/bin/python
from sympy import *
from utils import bcolors

### function to compute (T,r) transform of matrix ###

def transformationToRref(M):

    if not M: return None
    else:

        Mdash = M.row_join(eye(M.shape[0]))

        i = 0
        j = 0

        while i < M.shape[0] and j < M.shape[1]:

            if Mdash[i,j] == 0:
                for k in range(i,M.shape[0]):
                    if Mdash[k,j] != 0:
                        Mdash[i,:], Mdash[k,:] = Mdash[k,:], Mdash[i,:]
                        break
            else:
                Mdash[i,:] *= 1/Mdash[i,j]
                for k in range(M.shape[0]):
                    if k != i: Mdash[k,:] -= Mdash[k,j]*Mdash[i,:] 
                i += 1
 
            j += 1

        Mrref = Mdash[:,0:M.shape[1]]
        Trans = Mdash[:,M.shape[1]:]
        rank = i

        return [[Mrref, Mrref.shape], [Trans, Trans.shape], rank]


### compute T ###

def compute_transform(listOfPredicates, listOfActions, goalCompliantConditions, flag = False):

    print bcolors.HEADER + '\n>> Computing transform ' + bcolors.ENDC
    M = [[0 for act in listOfActions] for pred in goalCompliantConditions]

    for action in listOfActions:
        for effect in action[1]:
            if listOfPredicates[effect[0]] in goalCompliantConditions:
                M[goalCompliantConditions.index(listOfPredicates[effect[0]])][listOfActions.index(action)] = effect[1][1] - effect[1][0]

    M = Matrix(M)
    MRREF = transformationToRref(M)

    if flag:
        print "\n*** matrix M ***"
        print [M, M.shape]
        print "\n*** matrix M' ***"
        print MRREF[0]
        print "\n*** matrix T ***"
        print MRREF[1]
        print "\nTest M' = T*M : " + str(MRREF[0][0] == MRREF[1][0]*M)

    print bcolors.OKGREEN + "--> Transform passes test - M' = T*M" + bcolors.ENDC
    return [MRREF, M]




### main function ###

if __name__ == '__main__':

    M = Matrix(([1,2,3,4,2,3,4,2,3,4],[0,6,7,8,2,3,4,2,3,4],[9,10,11,12,2,3,4,2,3,4],[13,14,15,16,2,3,4,2,3,4],[17,18,19,20,2,3,4,2,3,4]))

    Mrref = transformationToRref(M)
    print "\nM = \n"  + str([M, M.shape])
    print "\nM' = \n" + str(Mrref[0])
    print "\nT = \n"  + str(Mrref[1])
    print "\nRank of M' = "  + str(Mrref[2])
 
    print "\n\n *** CHECK EXTERNAL ***\n"
    Mdash = M.rref()
    print str(Mdash)
    print "\n rank of M = " + str(len(Mdash[1])) 

    print "\n *** CHECK INTERNAL ***\n"
    print "M' is identical - " + str(Mdash[0] == Mrref[0][0])
    print "M' = TxM holds  - " + str(Mrref[0][0] == Mrref[1][0]*M)
    
