#!/usr/bin/python
import os, sys, copy
from utils import bcolors

#### SAS parser class ####

class readSAS:

    def __init__(self, fileName, flag = False):

        self.fileName     = fileName
        self.variableList = []
        self.operatorList = []
        self.initState    = []
        self.goalState    = []
        self.parseSASfile()

        if flag:
            self.printOutput()


    def parseSASfile(self):

        print bcolors.HEADER + '\n>> Reading SAS file - ' + bcolors.OKGREEN + self.fileName + '\n' + bcolors.ENDC
        sas_file = open(self.fileName,'r')

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
                self.variableList.append(newVariable)


            if 'begin_state' in newline:

                print bcolors.OKBLUE + '\t-> ...\n\t-> Reading initial state...' + bcolors.ENDC
                newline = sas_file.readline().strip()
                while 'end_state' not in newline:
                    self.initState.append(int(newline))
                    newline = sas_file.readline().strip()

                
            if 'begin_goal' in newline:

                print bcolors.OKBLUE + '\t-> ...\n\t-> Reading goal state...\n\t-> ...' + bcolors.ENDC
                self.goalState = copy.deepcopy(self.initState)
                newline = sas_file.readline().strip()
                newline = sas_file.readline().strip()

                while 'end_goal' not in newline:
                    temp = newline.split(' ')
                    self.goalState[int(temp[0])] = int(temp[1])
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
                        raise Exception(bcolors.FAIL + 'Associated effect conditions not supported!!' + bcolors.ENDC)
                    effectList.append([temp[1], [temp[2], temp[3]]])

                operatorCost = int(sas_file.readline().strip())
                newOperator  = [operatorName, effectList, operatorCost]
                self.operatorList.append(newOperator)

 
    def printOutput(self):

        print bcolors.HEADER + '\n>> Printing Parsed Output\n' + bcolors.ENDC
        print bcolors.OKGREEN + '-> State Variables...' + bcolors.ENDC
        for var in self.variableList:
            print var[0] + ' : ' + ' , '.join([temp for temp in var[1]])

        print bcolors.OKGREEN + '\n-> Initial State...\n' + bcolors.ENDC
        for varNum in range(len(self.initState)):
            print self.__return_variable_ID__(varNum) + ' = ' + str(self.initState[varNum]) + ' :: ' + self.__return_variable_name__(varNum,self.initState[varNum])

        print bcolors.OKGREEN + '\n-> Goal State...\n' + bcolors.ENDC
        for varNum in range(len(self.goalState)):
            print self.__return_variable_ID__(varNum) + ' = ' + str(self.goalState[varNum]) + ' :: ' + self.__return_variable_name__(varNum,self.goalState[varNum])
    
        print bcolors.OKGREEN + '\n-> Operator List...\n' + bcolors.ENDC
        for operator in self.operatorList:
            print bcolors.OKBLUE + operator[0] + bcolors.ENDC
            print 'Cost = ', operator[2]
            print 'Preconditions & Effects'
            effectList = operator[1]
            for effect in effectList:
                print self.__return_variable_ID__(effect[0]) + ' :: ' + str(effect[1][0]) + ' (' +  self.__return_variable_name__(effect[0],effect[1][0])  + ')' + ' --> ' + str(effect[1][1]) + ' (' + self.__return_variable_name__(effect[0],effect[1][1]) + ')'
            print
                
    def returnParsedData(self):
        return [self.variableList, self.initState, self.goalState, self.operatorList]


    def __return_variable_ID__(self, variableNumber):
        return self.variableList[variableNumber][0]


    def __return_variable_name__(self, variableNumber, variableValue):

        if variableValue == -1:
            return 'x'
        else:
            return self.variableList[variableNumber][1][variableValue]



### main function ###

if __name__ == '__main__':

    try: 
        input = readSAS(sys.argv[1])
    except:
        try:
            input = readSAS('output.sas')
        except:
            raise Exception(bcolors.FAIL + 'SAS File not found!!' + bcolors.ENDC)

    input.printOutput()
