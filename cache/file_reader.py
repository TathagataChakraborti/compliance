import sys
import numpy
import sympy
import re

listOfPredicates = []
listOfActions    = []

def print_predicates():
    for predicate in listOfPredicates:
        print predicate

def print_actions():
    for action in listOfActions:
        print "\nAction Name: " + action[0]
        print "preconditions: " + str(action[1])
        print "effects: " + str(action[2]) + '\n'

def read_domain_file(fileName):

    global listOfPredicates, listOfActions
    domain_file      = open(fileName, 'r')
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
                listOfPredicates.append(cc)
                
        if readActions and 'action' in line:
            newAction.append(line.split(' ')[1].strip());
            newPre = []
            newEff = []
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
                        if not '(and' in lleff and not '(increase' in lleff:
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
                    listOfActions.append(newAction)
                    newAction = []
                    break

        if '(:predicates' in line:
            readPredicates = True

        if '(:functions' in line:
            readActions    = True

    domain_file.close()


read_domain_file('grounded_domain.pddl')
print_predicates()
print_actions()
