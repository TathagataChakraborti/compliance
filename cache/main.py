import os, sys, copy
from sympy import *
import re
import rrefT
from problem_file import Problem 
from search import astarSearch 

flagOPT                 = True
listOfPredicates        = []
listOfActions           = []
initialState            = []
goalState               = []
compliantConditions     = []
goalCompliantConditions = []

def print_actions():
    print "\n*** ACTION DESCRIPTIONS ***"
    for action in listOfActions:
        print "\nAction Name: " + action[0]
        print "preconditions: " + str(action[1])
        print "effects: " + str(action[2])
        print "cost: " + str(action[3]) + '\n'

def print_predicates():
    print "*** DOMAIN PREDICATES ***\n"
    for predicate in listOfPredicates:
        print predicate


def read_initial_and_goal_states(domain_file, problem_file):

    global initialState, goalState
    initialState = [0]*len(listOfPredicates)
    goalState    = [0]*len(listOfPredicates)
    testEmptyString  = re.compile('\s*[A-Z]+\s*', re.IGNORECASE)
    problem_file = open(problem_file, 'r')
    readInitial  = False
    readGoal     = False

    for line in problem_file:

        if readInitial:
            cc = line[line.find("(")+1:line.find(")")].strip()
            if 'cost' in cc: continue
            elif not testEmptyString.match(cc):
                readInitial = False
            else:
                cc = cc.replace(" ","_")
                initialState[listOfPredicates.index(cc)] = 1

        if readGoal:
            cc = line[line.find("(")+1:line.find(")")].strip()
            if not testEmptyString.match(cc):
                readGoal = False
            else:
                if not cc == 'and':
                    cc = cc.replace(" ","_")
                    goalState[listOfPredicates.index(cc)] = 1

        if 'init' in line:
            readInitial = True

        if 'goal' in line:
            readGoal    = True

    problem_file.close()


def read_grounded_domain_file(fileName):

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
                    listOfActions.append(newAction)
                    newAction = []
                    break

        if '(:predicates' in line:
            readPredicates = True

        if '(:functions' in line:
            readActions    = True

    domain_file.close()


def compute_matrixM():

    global compliantConditions
    compliantConditions = copy.deepcopy(listOfPredicates)

    for predicate in listOfPredicates:
        for action in listOfActions:
            if bool(predicate in action[1]) != bool(predicate in action[2] or ('not ' + predicate) in action[2]):
                if predicate in compliantConditions:
                    compliantConditions.remove(predicate)

    compliantConditions = copy.deepcopy(listOfPredicates)     #hola - delete
    M = zeros(len(compliantConditions), len(listOfActions))
    for i in range(len(listOfActions)):
        predList = listOfActions[i][2]
        for pred in compliantConditions:
            if pred in predList:
                M[compliantConditions.index(pred), i] = 1
            elif 'not ' + pred in predList:
                M[compliantConditions.index(pred), i] = -1

    return M

def compute_matrixMdash(M):
    global goalCompliantConditions
    Mdash = zeros(0,len(listOfActions))
    for i in range(len(goalState)):
        #if bool(goalState[i] == 1) and bool(listOfPredicates[i] in compliantConditions):
        if listOfPredicates[i] in compliantConditions: #hola - delete
            Mdash = Mdash.row_insert(Mdash.shape[0], M[i,:])
            goalCompliantConditions.append(listOfPredicates[i])

    MRREF = rrefT.transformationToRref(Mdash)
    print "goalCompliantConditions : " + str(len(goalCompliantConditions))
    print "\n*** matrix M ***"
    print [M, M.shape]
    print "\n*** matrix M' ***"
    print MRREF[0]
    print "\n*** matrix T ***"
    print MRREF[1]
    print "\nTest M' = T*M : " + str(MRREF[0][0] == MRREF[1][0]*Mdash)
    return MRREF

def generate_problem():
    read_grounded_domain_file('../domains/blocks_world/domain.pddl')
    M = compute_matrixM()
    read_initial_and_goal_states('../domains/blocks_world/domain.pddl', '../domains/blocks_world/problem.pddl')
    print_predicates()
    print_actions()
    print "compliantConditions : " + str(len(compliantConditions))
    print "listOfPredicates : " + str(len(listOfPredicates))
    T = compute_matrixMdash(M)
    return T
    
if __name__ == '__main__':
    Mdash = generate_problem()
    prob = Problem(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mdash)
    path = astarSearch(prob, flagOPT)
    if path:    print "*** FINAL PLAN: ***\n" + str(path[1]) + "\n" + "Cost of Plan: " + str(len(path[1]))
    else:       print "*** NO PLAN FOUND ***"
    
