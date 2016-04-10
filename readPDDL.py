#!/usr/bin/python
import os, sys, copy, re
from utils import bcolors

PR2PLAN_COMMAND = "touch obs.dat && ~/pr2plan -d $1 -i $2 -o obs.dat > stdout.txt"

#### SAS parser class ####

class readPDDL:

    def __init__(self, domainFileName, problemFileName, flag = False):

        self.domainFile   = domainFileName
        self.problemFile  = problemFileName
        self.variableList = []
        self.operatorList = []
        self.initialState = []
        self.goalState    = []
        self.read_grounded_domain_file()

        if flag:
            self.printOutput()


    def read_grounded_domain_file(self):

        print bcolors.HEADER + '\n>> Grounding domain and problem files' + bcolors.ENDC
        cmd = PR2PLAN_COMMAND.replace('$1', self.domainFile).replace('$2', self.problemFile)
        os.system(cmd)

        self.domainFile   = 'pr-domain.pddl'
        self.problemFile  = 'pr-problem.pddl'

        temp = ''
        with open(self.domainFile, 'r') as tempFile:
            for line in tempFile:
                if 'EXPLAIN' not in line:
                    temp += line

        with open(self.domainFile, 'w') as tempFile:
            tempFile.write(temp)

        temp = ''
        with open(self.problemFile, 'r') as tempFile:
            for line in tempFile:
                if 'EXPLAIN' not in line:
                    temp += line

        with open(self.problemFile, 'w') as tempFile:
            tempFile.write(temp)

        print bcolors.HEADER + '\n>> Reading grounded domain and problem files - ' + bcolors.ENDC

        domain_file      = open(self.domainFile, 'r')
        testEmptyString  = re.compile('\s*[A-Z]+\s*', re.IGNORECASE)
        newAction        = []
        readPredicates   = False
        readActions      = False
        readActionName   = False
        readActionPre    = False
        readActionEff    = False
        paranFlag        = 0

        for line in domain_file:

            if readPredicates:
                cc = line[line.find("(")+1:line.find(")")].strip()
                if not testEmptyString.match(cc):
                    readPredicates = False
                else:
                    self.variableList.append(cc)

            if readActions and 'action' in line:
                newAction.append(line.split(' ')[1].strip());
                newPre = []
                newEff = []
                cost = 0
                for ll in domain_file:
                    flag = 0
                    if ':precondition' in ll:
                        flag = 1
                        for llpre in domain_file:
                            if not '(and' in llpre:
                                if llpre.strip() == ')':
                                    break
                                else:
                                    newPre.append(llpre[llpre.find("(")+1:llpre.find(")")].strip())

                    if ':effect' in ll:
                        flag = 2
                        for lleff in domain_file:
                            if '(increase' in lleff:
                                start = lleff.find(')')+2
                                end   = lleff.find(')', start)
                                cost  = int(lleff[start:end])
                            else:
                                if not '(and' in lleff:
                                    if lleff.strip() == ')':
                                        break
                                    else:
                                        cc = lleff[lleff.find("(")+1:lleff.find(")")].strip()
                                        if 'not' in cc:
                                            cc = " ".join(cc.split("(")).replace("   "," ")
                                        newEff.append(cc)

                    if flag == 2:
                        newAction.append(newPre)
                        newAction.append(newEff)
                        newAction.append(cost)
                        self.operatorList.append(newAction)
                        newAction = []
                        break

            if '(:predicates' in line:
                readPredicates = True

            if '(:functions' in line:
                readActions    = True

        domain_file.close()

        self.initialState = [0]*len(self.variableList)
        self.goalState    = [0]*len(self.variableList)
        testEmptyString  = re.compile('\s*[A-Z]+\s*', re.IGNORECASE)
        problem_file = open(self.problemFile, 'r')
        readInitial  = False
        readGoal     = False

        for line in problem_file:

            if readInitial:
                cc = line[line.find("(")+1:line.find(")")].strip()
                if 'cost' in cc: 
                    continue
                elif not testEmptyString.match(cc):
                    readInitial = False
                else:
                    cc = cc.replace(" ","_")
                    self.initialState[self.variableList.index(cc)] = 1

            if readGoal:
                cc = line[line.find("(")+1:line.find(")")].strip()
                if not testEmptyString.match(cc):
                    readGoal = False
                else:
                    if not cc == 'and':
                        cc = cc.replace(" ","_")
                        self.goalState[self.variableList.index(cc)] = 1

            if 'init' in line:
                readInitial = True

            if 'goal' in line:
                readGoal    = True

        problem_file.close()
    

 
    def pre_process(self, listOfPredicates, listOfActions, goalState):
        
        compliantConditions = copy.deepcopy(listOfPredicates)
        goalCompliantConditions = copy.deepcopy(compliantConditions)
        return [compliantConditions, goalCompliantConditions]
    

    def printOutput(self):

        print bcolors.HEADER + '\n>> Printing Parsed Output\n' + bcolors.ENDC
        print bcolors.OKGREEN + '-> State Variables...' + bcolors.ENDC
        for var in self.variableList:
            print var

        print bcolors.OKGREEN + '\n-> Initial State...\n' + bcolors.ENDC
        for idx in range(len(self.initialState)):
            if self.initialState[idx] == 1:
                print self.variableList[idx]

        print bcolors.OKGREEN + '\n-> Goal State...\n' + bcolors.ENDC
        for idx in range(len(self.goalState)):
            if self.goalState[idx] == 1:
                print self.variableList[idx]

        print bcolors.OKGREEN + '\n-> Operator List...\n' + bcolors.ENDC
        for action in self.operatorList:
            print "\nAction Name: " + action[0]
            print "preconditions: " + str(action[1])
            print "effects: " + str(action[2])
            print "cost: " + str(action[3]) + '\n'
                
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

    input = readPDDL(sys.argv[1], sys.argv[2])
    input.printOutput()
    sys.exit(0)

    try: 
        input = readPDDL(sys.argv[1], sys.argv[2])
    except:
        try:
            input = readPDDL('domain.pddl', 'problem.pddl')
        except:
            raise Exception(bcolors.FAIL + 'File not found!!' + bcolors.ENDC)

    input.printOutput()
