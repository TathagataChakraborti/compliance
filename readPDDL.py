#!/usr/bin/python
import os, sys, copy, re
from utils import bcolors

#### PDDL parser class ####

class readPDDL:

    def __init__(self, domainFileName, problemFileName, flag = False):

        self.domainFile              = domainFileName
        self.problemFile             = problemFileName
        self.variableList            = []
        self.operatorList            = []
        self.initState               = []
        self.goalState               = []
        self.compliantConditions     = []
        self.goalCompliantConditions = []
        self.read_grounded_domain_file()

        if flag:
            self.printOutput()


    def read_grounded_domain_file(self):

        print bcolors.HEADER + '\n>> Reading grounded domain and problem files' + bcolors.ENDC

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
                    self.variableList.append([cc, [str(i) for i in range(2)]])

            if readActions and 'action' in line:

                actionName = line.split(' ')[1].strip()
                newPre     = []
                newEff     = []
                cost       = 0

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

                        effect_list = []

                        for pre in newPre:
                            predicate_id  = [var[0] for var in self.variableList].index(pre)
                            old_value     = 1
                            if pre in newEff:
                                new_value = 1
                            elif 'not ' + pre in newEff:
                                new_value = 0
                            else:
                                new_value = -1
                                
                            effect_list.append([predicate_id, [old_value, new_value]])

                        for eff in newEff:
                            
                            old_value = -1
                            new_value = 1

                            if 'not ' in eff:
                                new_value = 0
                                eff       = eff.split(' ')[1].strip()
                            
                            if eff not in newPre:
                                predicate_id  = [var[0] for var in self.variableList].index(eff)
                                effect_list.append([predicate_id, [old_value, new_value]])

                        new_action_entry = [actionName, effect_list, cost]
                        self.operatorList.append(new_action_entry)
                        newAction = []
                        break

            if '(:predicates' in line:
                readPredicates = True

            if '(:functions' in line:
                readActions    = True

        domain_file.close()

        self.initState    = [0]*len(self.variableList)
        self.goalState    = [0]*len(self.variableList)
        testEmptyString   = re.compile('\s*[A-Z]+\s*', re.IGNORECASE)
        problem_file      = open(self.problemFile, 'r')
        readInitial       = False
        readGoal          = False

        for line in problem_file:

            if readInitial:
                cc = line[line.find("(")+1:line.find(")")].strip()
                if 'cost' in cc: 
                    continue
                elif not testEmptyString.match(cc):
                    readInitial = False
                else:
                    cc = cc.replace(" ","_")
                    predicate_id  = [var[0] for var in self.variableList].index(cc)
                    self.initState[predicate_id] = 1

            if readGoal:
                cc = line[line.find("(")+1:line.find(")")].strip()
                if not testEmptyString.match(cc):
                    readGoal = False
                else:
                    if not cc == 'and':
                        cc = cc.replace(" ","_")
                        predicate_id  = [var[0] for var in self.variableList].index(cc)
                        self.goalState[predicate_id] = 1

            if 'init' in line:
                readInitial = True

            if 'goal' in line:
                readGoal    = True

        problem_file.close()
    
        self.compliantConditions = copy.deepcopy(self.variableList)
        for action in self.operatorList:
            for effect in action[1]:
                if -1 in effect[1]:
                    try:
                        self.compliantConditions.remove(self.variableList[effect[0]])
                    except:
                        pass
        
        for predicate in self.goalState:
            if predicate == 0:
                try:
                    self.goalCompliantConditions.remove(self.variableList[predicate])
                except:
                    pass

        #self.compliantConditions     = copy.deepcopy(self.variableList)
        #self.goalCompliantConditions = copy.deepcopy(self.compliantConditions)


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

        print bcolors.OKGREEN + '-> Goal Compliant Variables...' + bcolors.ENDC
        for var in self.goalCompliantConditions:
            print var[0] + ' : ' + ' , '.join([temp for temp in var[1]])



    def returnParsedData(self):
        return [self.variableList, self.initState, self.goalState, self.operatorList, self.compliantConditions, self.goalCompliantConditions]


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
