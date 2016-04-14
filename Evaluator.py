#!/usr/bin/python
from sympy import *
from utils import bcolors
from utils import PriorityQueue
from problem_class import Problem
import copy, numpy
from gurobipy import *

### evaluator class ###

class Evaluator(Problem):

    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag = False):
        
        Problem.__init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag)


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

        m = Model("milp")
        m.modelSense = GRB.MINIMIZE

        variables = {}
        for action in self.listOfActions:
            variables[action[0]] = m.addVar(vtype=GRB.INTEGER, lb=0, name=action[0])

        m.update()

        current   = zeros(len(self.goalCompliantConditions),1)
        goal      = zeros(len(self.goalCompliantConditions),1)
        for idx in range(len(self.goalCompliantConditions)):
            current[idx] = state[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
            goal[idx]    = self.goalState[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
        delta     = (goal - current)
        
        for gc_var in self.goalCompliantConditions:
            m.addConstr(quicksum(self.M[self.goalCompliantConditions.index(gc_var), self.listOfActions.index(action)]*variables[action[0]] for action in self.listOfActions) >= delta[self.goalCompliantConditions.index(gc_var)])

        m.setObjective(self.__cost_function_milp__(variables))
        m.params.OutputFlag = 0
        m.optimize()
    
        status = m.status
        if status == GRB.OPTIMAL:
            solution_list = m.getVars()
            for variable in solution_list:
                if variable.X > 0.5: print bcolors.OKBLUE + '-->> ' + variable.VarName + bcolors.ENDC
            return m.ObjVal
        else:
            print bcolors.OKGREEN + '--> Warning! Optimization stopped with Code ' + bcolors.OKBLUE + str(status) + bcolors.ENDC
            return 0.0
        

    def heuristic_trivial(self, state):
        return 0.0


    def __cost_function_milp__(self, variables):
        K = 1.0
        expr = K*quicksum(variables[action[0]] for action in self.listOfActions)
        return expr

