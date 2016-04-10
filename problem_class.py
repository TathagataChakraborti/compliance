#!/usr/bin/python
import copy
from utils import bcolors
from sympy import *

### problem class ###

class Problem:

    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag = False):

        print bcolors.HEADER + '\n>> Building problem instance ' + bcolors.ENDC
    
        self.listOfPredicates        = listOfPredicates
        self.listOfActions           = listOfActions
        self.goalState               = goalState
        self.initialState            = initialState
        self.compliantConditions     = compliantConditions 
        self.goalCompliantConditions = goalCompliantConditions
        self.cost_flag               = cost_flag
        
        self.__cache_transform__(Mrref)
        

    def getStartState(self):
        return self.initialState


    def getGoalState(self):
        return self.goalState


    def getTransform(self):
        return [self.T, self.r, self.Z]


    def isGoalState(self, state):

        for idx in range(len(self.listOfPredicates)):
            if self.goalState[idx] > 0 and state[idx] != self.goalState[idx]:
                return False

        return True


    def getSuccessors(self, state):

        oldState         = state[0]
        currentCost      = len(state[1])
        listOfSuccessors = []

        for action in self.listOfActions:

            applicable = True
            for condition in action[1]:
                if condition[1][0] != -1:
                    applicable = oldState[condition[0]] == condition[1][0]
                    if not applicable: break

            if applicable:
                newState = copy.deepcopy(oldState)
                for condition in action[1]:
                    newState[condition[0]] = condition[1][1]
                    

                if self.cost_flag:
                    newCost = currentCost + action[2]
                else:
                    newCost = currentCost + 1

                listOfSuccessors.append([newState, action[0], newCost])

        return listOfSuccessors
        

    def __cache_transform__(self, Mrref):

        print bcolors.OKGREEN + '--> Caching transforms ' + bcolors.ENDC

        self.T      = Mrref[1][0]
        self.r      = Mrref[2]
        self.Md     = Mrref[0][0]
        Y           = self.Md[:self.r,:]

        if self.cost_flag:

            Q       = [[0 for action in self.listOfActions] for action in self.listOfActions]
            
            for action in self.listOfActions:
                idx = self.listOfActions.index(action)
                Q[idx][idx] = action[2]

            Qinv2   = Matrix(Q)**-2
            
            self.Z  = Qinv2 * Y.transpose() * ( Y * Qinv2 * Y.transpose() ).inv()

        else:

            self.Z  = Y.transpose()*(Y*Y.transpose()).inv()
