#!/usr/bin/python
from sympy import *
from utils import bcolors
from utils import PriorityQueue
from problem_class import Problem
import copy, numpy
from gurobipy import *
import operator
import functools
import math

WEIGHT_THRESH = 0.0001
W_EPS = 0.5

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

    def heuristic_calculator(self, state, cost_function, isInteger, isCeil = False):
        '''
        Method for calculating heuristics by solving optimization problems via Gurobi
        ''' 
        m = Model("milp")
        m.modelSense = GRB.MINIMIZE

        variables = {}
        for action in self.listOfActions:
            if isInteger:
              variables[action[0]] = m.addVar(vtype=GRB.INTEGER, lb=0, name=action[0])
            else:
              variables[action[0]] = m.addVar(vtype=GRB.CONTINUOUS, lb=0, name=action[0])
        m.update()

        current   = zeros(len(self.goalCompliantConditions),1)
        goal      = zeros(len(self.goalCompliantConditions),1)
        for idx in range(len(self.goalCompliantConditions)):
            current[idx] = state[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
            goal[idx]    = self.goalState[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
        delta     = (goal - current)
        
        for gc_var in self.goalCompliantConditions:
            m.addConstr(quicksum(self.M[self.goalCompliantConditions.index(gc_var), self.listOfActions.index(action)]*variables[action[0]] for action in self.listOfActions) == delta[self.goalCompliantConditions.index(gc_var)])

        m.setObjective(cost_function(variables))
        m.params.OutputFlag = 0
        m.optimize()
    
        status = m.status
        if status == GRB.OPTIMAL:
            solution_list = m.getVars()
            sum = 0
            for variable in solution_list:
#                if variable.X > 0.0: print bcolors.OKBLUE + '-->> ' + variable.VarName + bcolors.ENDC
                if isCeil: sum += math.ceil(variable.X)
            if isCeil: return sum
            return m.ObjVal
        else:
            print bcolors.OKGREEN + '--> Warning! Optimization stopped with Code ' + bcolors.OKBLUE + str(status) + bcolors.ENDC
            return 0.0
        

    def heuristic_trivial(self, state):
        return 0.0

    ''' MILP evaluation '''
    def heuristic_milp(self, state):
      return self.heuristic_calculator(state, self.__cost_function_milp__, True)
    
    def __cost_function_milp__(self, variables):
        K = 1.0
        expr = K*quicksum(variables[action[0]] for action in self.listOfActions)
        return expr
   
    ''' Ceiling Real valued linear program with l1 norm '''
    def heuristic_real_l1_ceil(self, state):
      return self.heuristic_calculator(state, self.__cost_real_l1__, False, True)
 
    ''' Real valued linear program with l1 norm '''
    def heuristic_real_l1(self, state):
      return self.heuristic_calculator(state, self.__cost_real_l1__, False)
      
    def __cost_real_l1__(self, variables):
        K = 1.0
        expr = K*quicksum(variables[action[0]] for action in self.listOfActions)
        return expr

    def heuristic_real_l2(self, state):
	return self.heuristic_calculator(state, self.__cost_real_l2__, False)

    def __cost_real_l2__(self, variables):
	K = 1.0
        expr = K*quicksum(variables[action[0]]*variables[action[0]] for action in self.listOfActions)
        return expr
    def heuristic_reweighted_l1(self, state):
        not_found = True
        old_x = []
        x = []
        iter_cnt = 0
        while (not_found):
            m = Model("rew_l1")
            W = numpy.identity(len(self.listOfActions))

            variables = {}
            for action in self.listOfActions:
                variables[action[0]] = m.addVar(vtype=GRB.CONTINUOUS, lb=0, name=action[0])

            m.update()

            current   = zeros(len(self.goalCompliantConditions),1)
            goal      = zeros(len(self.goalCompliantConditions),1)
            for idx in range(len(self.goalCompliantConditions)):
                current[idx] = state[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
                goal[idx]    = self.goalState[self.listOfPredicates.index(self.goalCompliantConditions[idx])]
            delta     = (goal - current)

            for gc_var in self.goalCompliantConditions:
                m.addConstr(quicksum(self.M[self.goalCompliantConditions.index(gc_var), self.listOfActions.index(action)]*variables[action[0]] for action in self.listOfActions) == delta[self.goalCompliantConditions.index(gc_var)])

            m.setObjective(self.__cost_function_reweighted_l1__(variables, W))
            m.params.OutputFlag = 0
            m.optimize()

            status = m.status
            old_x = copy.copy(x)
            x = []
            if status == GRB.OPTIMAL:
                solution_list = m.getVars()
#                for variable in solution_list:
#                    if variable.X > 0: print bcolors.OKBLUE + '-->> ' + variable.VarName + " - "+str(variable.X)+ bcolors.ENDC
                #return m.ObjVal
                for variable in solution_list:
                    x.append(variable.X)
            else:
                for i in range(len(old_x)):
                    old_x.append(0.0)
                print bcolors.OKGREEN + '--> Warning! Optimization stopped with Code ' + bcolors.OKBLUE + str(status) + bcolors.ENDC
                #return 0.0
            sum_x = 0
            for i in range(len(old_x)):
                sum_x = sum_x + (old_x[i] - x[i]) * (old_x[i] - x[i])

            if sum_x < WEIGHT_THRESH and iter_cnt > 0:
                not_found = False
            for a_ind in range(len(self.listOfActions)):
                W[a_ind][a_ind] = 1.00/(abs(x[a_ind]) + W_EPS)
            #print "new weights are",W
            #print "sum_X is ",sum_x
            iter_cnt = iter_cnt + 1
        op_cnt = 0
        for v in x:
            op_cnt = op_cnt + math.ceil(v)
            #print bcolors.OKBLUE + '-->> ' + variables[x.index(v)] + bcolors.ENDC
        #print bcolors.OKBLUE + '-->> total cost value '+str(op_cnt)
        #exit(0)
        return op_cnt

    def __cost_function_reweighted_l1__(self, variables, weight_mat):
        expr = quicksum(variables[action[0]] * weight_mat[self.listOfActions.index(action)][self.listOfActions.index(action)] for action in self.listOfActions)
        return expr

