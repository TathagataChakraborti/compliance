#!/usr/bin/python
from sympy import *
from utils import bcolors
from utils import PriorityQueue
from problem_class import Problem
import copy, numpy
#import gurobipy

### evaluator class ###

class Evaluator(Problem):

    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag = False):
        
        Problem.__init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag)


    def evaluate(self, state, heuristicName = 'equality'):
        
        method = getattr(self, 'heuristic_' + heuristicName)
        return method(state)


    def heuristic_equality(self, state):

        [T, r, Z] = self.getTransform()
        current   = zeros(len(self.goalCompliantConditions),1)
        goal      = zeros(len(self.goalCompliantConditions),1)


        for idx in range(len(self.goalCompliantConditions)):
            
            current[idx] = state[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
            goal[idx]    = self.goalState[self.listOfPredicates.index(self.goalCompliantConditions[idx])]

        d   = (goal - current)
        Td  = T*d

        if sum(Td[r+1:]) != 0:

            return -1

        else:

            c   = Matrix(Td[:r])
            v   = Z*c
            l1norm = numpy.linalg.norm(v, ord=1)
            return l1norm


    def heuristic_milp(self, state):
        return 0.0

    def heuristic_trivial(self, state):
        return 0.0
