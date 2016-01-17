#!/usr/bin/python
import os, sys, copy
from utils import bcolors


def readSAS(fileName, flag = False):

    print bcolors.HEADER + 'Reading SAS file - ' + bcolors.OKGREEN + fileName + bcolors.ENDC
    sas_file = open(fileName,'r')
    variableList = []
    operatorList = []
    initState    = []
    goalState    = []

    while True:

        newline = sas_file.readline().strip()
        if not newline: break


        if 'begin_variable' in newline:
            print bcolors.OKBLUE + '\t-> Reading new variable...' + bcolors.ENDC
            variableID    = sas_file.readline().strip()
            isDerived     = int(sas_file.readline().strip()) != -1
            if isDerived:
                raise Exception(bcolors.FAIL + 'Axiom state variables not supported!!' + bcolors.ENDC)
            variableRange = []
            numVarRange   = int(sas_file.readline().strip())
            for idx in range(numVarRange):
                newAtom   = sas_file.readline().strip().replace('Atom','').strip()
                variableRange.append(newAtom)
            newVariable   = [variableID, variableRange]    
            variableList.append(newVariable)


        if 'begin_state' in newline:
            print bcolors.OKBLUE + '\t-> ...\n\t-> Reading initial state...' + bcolors.ENDC
            newline = sas_file.readline().strip()
            while 'end_state' not in newline:
                initState.append(int(newline))
                newline = sas_file.readline().strip()


        if 'begin_goal' in newline:
            print bcolors.OKBLUE + '\t-> ...\n\t-> Reading goal state...\n\t-> ...' + bcolors.ENDC
            goalState = copy.deepcopy(initState)
            newline = sas_file.readline().strip()
            newline = sas_file.readline().strip()
            while 'end_goal' not in newline:
                temp = newline.split(' ')
                goalState[int(temp[0])] = int(temp[1])
                newline = sas_file.readline().strip()

        if 'begin_operator' in newline:
            print bcolors.OKBLUE + '\t-> Reading new operator...' + bcolors.ENDC
            operatorName = sas_file.readline().strip()
            effectList = []
            numPrevail   = int(sas_file.readline().strip())
            for idx in range(numPrevail):
                temp = [int(t) for t in sas_file.readline().strip().split(' ')]
                effectList.append([temp[0], [temp[1], temp[1]]])
            numEffects   = int(sas_file.readline().strip())
            for idx in range(numEffects):
                temp = [int(t) for t in sas_file.readline().strip().split(' ')]
                if temp[0] != 0:
                    raise Exception(bcolors.FAIL + 'Associated Effect Conditions not supported!!' + bcolors.ENDC)
                effectList.append([temp[1], [temp[2], temp[3]]])
            operatorCost = int(sas_file.readline().strip())
            newOperator  = [operatorName, effectList, operatorCost]
            operatorList.append(newOperator)

 
    outputList = [variableList, initState, goalState, operatorList]
    if flag: printOutput(outputList)
    else:    return outputList
   

def printOutput(outputList):

    variableList, initState, goalState, operatorList = outputList
    print bcolors.HEADER + '***Printing Parsed Output***' + bcolors.ENDC
    print bcolors.OKGREEN + '-> State Variables...' + bcolors.ENDC
    for var in variableList:
        print var[0] + ' : ' + ' , '.join([temp for temp in var[1]])

    print bcolors.OKGREEN + '-> Initial State...' + bcolors.ENDC
    for varNum in range(len(initState)):
        print variableList[varNum][0] + ' = ' + str(initState[varNum]) + ' :: ' + variableList[varNum][1][initState[varNum]]

    print bcolors.OKGREEN + '-> Goal State...' + bcolors.ENDC
    for varNum in range(len(goalState)):
        print variableList[varNum][0] + ' = ' + str(goalState[varNum]) + ' :: ' + variableList[varNum][1][goalState[varNum]]
    
    print bcolors.OKGREEN + '-> Operator List...' + bcolors.ENDC
    for operator in operatorList:
        print bcolors.OKBLUE + operator[0] + bcolors.ENDC
        print 'Cost = ', operator[2]
        print 'Preconditions & Effects'
        effectList = operator[1]
        for effect in effectList:
            print variableList[effect[0]][0] + ' :: ' + str(effect[1][0]) + ' (' + variableList[effect[0]][1][effect[1][0]] + ')' + ' --> ' + str(effect[1][1]) + ' (' + str(variableList[effect[0]][1][effect[1][1]]) + ')'
        print

def return_variable_ID():
    pass

def return_variable_name():
    pass



if __name__ == '__main__':

    readSAS('output.sas', True)
    sys.exit(0)

    try: 
        readSAS(sys.argv[1], True)
    except:
        
        try:
            readSAS('output.sas', True)
        except:
            raise Exception(bcolors.FAIL + 'SAS File not found!!' + bcolors.ENDC)
