#!/usr/bin/python
from sympy import *
from utils import bcolors
from utils import PriorityQueue
import copy, numpy, math
from Evaluator import Evaluator

### planner class ###

class Planner(Evaluator):

    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag = False):
        
        Evaluator.__init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag)

    
    def aStarSearch(self, heuristicName = 'equality'):

        method = getattr(self, 'heuristic_' + heuristicName)
        print bcolors.HEADER + "\n>> Running A* Search" + bcolors.ENDC
        
        startState              = self.getStartState()
        goalState               = self.getGoalState()
        [T, r, Z]               = self.getTransform()
        listOfPredicates        = self.listOfPredicates
        goalCompliantConditions = self.goalCompliantConditions

        fval                    = float(method(startState))
        print bcolors.OKGREEN + "--> Initial heuristic estimate = " + bcolors.OKBLUE + str(fval) + bcolors.ENDC

        fringe                  = PriorityQueue()
        closed                  = []
        numberOfStatesExpanded  = 0
        printloop               = 0
        fringe.push([startState, [], 0.0], fval)

        while not fringe.isEmpty():

            if numberOfStatesExpanded%100 == 0: print bcolors.OKGREEN + "--> Number of states expanded > " + str(numberOfStatesExpanded) + bcolors.ENDC
                
            node = fringe.pop()
            if self.isGoalState(node[0]):
                print bcolors.OKGREEN + "--> Goal Found. Final number of states expanded = " + bcolors.OKBLUE + str(numberOfStatesExpanded) + bcolors.ENDC
                return [node[1], node[2]]

            numberOfStatesExpanded += 1
            successor_list          = []

            if node[0] not in closed:
                closed.append(node[0])
                successor_list = self.getSuccessors(node)
                while len(successor_list) > 0:
                    put = successor_list.pop()
                    if put[0] not in closed:

                        hval = float(method(put[0]))
                        if hval != -1:
                            newnode = [put[0], node[1] + [put[1]], put[2] + hval]
                            fringe.push(newnode, newnode[2])

        print bcolors.OKGREEN + "--> Search Terminated. Final number of states expanded = " + bcolors.OKBLUE + str(numberOfStatesExpanded) + bcolors.ENDC
        return None
