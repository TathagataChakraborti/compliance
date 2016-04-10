#!/usr/bin/python
from sympy import *
from utils import bcolors
from utils import PriorityQueue
import copy, numpy
from problem_class import Problem

### planner class ###

class Planner(Problem, Heuristic):

    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag):
        
        Problem.__init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag)

    
    def astarSearch(problem, heuristic = 'eqn'):
        
        print bcolors.HEADER + "\n>> Running A* Search" + bcolors.ENDC
        
        startState              = problem.getStartState()
        goalState               = problem.getGoalState()
        [T, r, Z]               = problem.getTransform()
        listOfPredicates        = problem.listOfPredicates
        goalCompliantConditions = problem.goalCompliantConditions

        fval                    = float(heuristic(startState, problem))
        print bcolors.OKGREEN + "--> Initial heuristic estimate = " + bcolors.OKBLUE + str(fval) + bcolors.ENDC

        fringe                  = PriorityQueue()
        closed                  = []
        numberOfStatesExpanded  = 0
        printloop               = 0
        fringe.push([startState, [], 0.0], fval)

        while not fringe.isEmpty():

            printloop += 1
            if printloop == 300:
                printloop = 0
                print bcolors.OKGREEN + "--> Number of states expanded > " + str(numberOfStatesExpanded) + bcolors.ENDC
            
            node = fringe.pop()
            if problem.isGoalState(node[0]):
                print bcolors.OKGREEN + "--> Goal Found. Final number of states expanded = " + bcolors.OKBLUE + str(numberOfStatesExpanded) + bcolors.ENDC
                return node

            numberOfStatesExpanded += 1
            successor_list          = []

            if node[0] not in closed:
                closed.append(node[0])
                successor_list = problem.getSuccessors(node)
                while len(successor_list) > 0:
                    put = successor_list.pop()
                    if put[0] not in closed:

                        hval = heuristic(put[0], problem)
                        if hval != -1:
                            newnode = copy.deepcopy(node)
                            newnode[0] = put[0]
                            newnode[1] = newnode[1] + [put[1]]
                            newnode[2] = put[2] + hval
                            fringe.push(newnode,newnode[2])

        print bcolors.OKGREEN + "--> Search Terminated. Final number of states expanded = " + bcolors.OKBLUE + str(numberOfStatesExpanded) + bcolors.ENDC
        return None



def heuristic(state, problem):
    
    goalState               = problem.getGoalState()
    [T, r, Z]               = problem.getTransform()
    listOfPredicates        = problem.listOfPredicates
    goalCompliantConditions = problem.goalCompliantConditions
    current                 = zeros(len(goalCompliantConditions),1)
    goal                    = zeros(len(goalCompliantConditions),1)

    for idx in range(len(goalCompliantConditions)):

        current[idx] = state[listOfPredicates.index(goalCompliantConditions[idx])]
        goal[idx]    = goalState[listOfPredicates.index(goalCompliantConditions[idx])]

    d   = (goal - current)
    Td  = T*d

    if sum(Td[r+1:]) != 0:

        return -1

    else:

        c   = Matrix(Td[:r])
        v   = Z*c
        l1norm = numpy.linalg.norm(v, ord=1)
        return l1norm
