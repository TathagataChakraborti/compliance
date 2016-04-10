#!/usr/bin/python
import os, sys, copy
from sympy import *
import re
#import rrefT
#from problem_file import Problem 
#from search import astarSearch 
from readSAS import readSAS
from utils import bcolors

SAS_GENERATOR_COMMAND = "~/Desktop/FAST-DOWNWARD/src/translate/translate.py $1 $2 > stdout.txt"

def compute_transform(listOfPredicates, listOfActions, goalCompliantConditions):

    print bcolors.HEADER + '\n>> Computing transform ' + bcolors.ENDC
    M = zeros(len(goalCompliantConditions), len(listOfActions))

    for action in listOfActions:
        for effect in action[1]:
            print action, effect
            print listOfPredicates[effect[0]]

            if listOfPredicates[effect[0]] in goalCompliantConditions:
                print goalCompliantConditions.index(listOfPredicates[effect[0]])
                print listOfActions.index(action)
                print effect[1][1] - effect[1][0]
                M[goalCompliantConditions.index(listOfPredicates[effect[0]])][listOfActions.index(action)] = effect[1][1] - effect[1][0]

    MRREF = rrefT.transformationToRref(M)
    print "goalCompliantConditions : " + str(len(goalCompliantConditions))
    print "\n*** matrix M ***"
    print [M, M.shape]
    print "\n*** matrix M' ***"
    print MRREF[0]
    print "\n*** matrix T ***"
    print MRREF[1]
    print "\nTest M' = T*M : " + str(MRREF[0][0] == MRREF[1][0]*M)
    
    print bcolors.OKGREEN + "\n>> Transform passes test - M' = T*M" + bcolors.ENDC
    return MRREF


def pre_process(listOfPredicates, listOfActions, goalState):

    compliantConditions = copy.deepcopy(listOfPredicates)

    for action in listOfActions:
        for effect in action[1]:
            if -1 in effect[1]:
                try:
                    compliantConditions.remove(listOfPredicates[effect[0]])
                except:
                    pass

    goalCompliantConditions = copy.deepcopy(compliantConditions)
    
    for predicate in goalState:
        if predicate == 0:
            try:
                goalCompliantConditions.remove(listOfPredicates[predicate])
            except:
                pass

    return [compliantConditions, goalCompliantConditions]


class Planner():

    def __init__(self, domainFile, problemFile, sas_data):
        pass


class Estimator():

    def __init__(self, domainFile, problemFile, sas_data):
        pass


### main function ###

if __name__ == '__main__':
    
    try:

        domainFile  = sys.argv[1]
        problemFile = sys.argv[2]

        try:
        
            cmd = SAS_GENERATOR_COMMAND.replace('$1', domainFile).replace('$2', problemFile)
            os.system(cmd)

        except:
            raise Exception('Failed to generate SAS file! Check input domain and problem files.')

    except:
        raise Exception('Invalid Input! Usage: >> python main.py <domainfile> <problemfile>')

    debug_flag = '--debug' in '_'.join(sys.argv)

    # parse SAS data #
    sas_data = readSAS('output.sas', debug_flag)
    [listOfPredicates, initialState, goalState, listOfActions] = sas_data.returnParsedData()
    [compliantConditions, goalCompliantConditions] = pre_process(listOfPredicates, listOfActions, goalState)

    # generate transformation #
    T = compute_transform(listOfPredicates, listOfActions, goalCompliantConditions, debug_flag)

    sys.exit(0)

    # solve #
    problem_object = Problem(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, T)
    path           = astarSearch(problem_object)
    if path:    print "*** FINAL PLAN: ***\n" + str(path[1]) + "\n" + "Cost of Plan: " + str(len(path[1]))
    else:       print "*** NO PLAN FOUND ***"
    
