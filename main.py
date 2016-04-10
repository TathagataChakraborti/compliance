#!/usr/bin/python
import os, sys, copy
from problem_class import Problem 
from Planner import Planner
from Evaluator import Evaluator
from readSAS import readSAS
from matpy import compute_transform
from utils import bcolors

SAS_GENERATOR_COMMAND = "~/Desktop/FAST-DOWNWARD/src/translate/translate.py $1 $2 > stdout.txt"

### main function ###

if __name__ == '__main__':
    
    try:

        print bcolors.HEADER + '\n>> Reading data' + bcolors.ENDC

        domainFile  = sys.argv[1]
        problemFile = sys.argv[2]

        try:
        
            cmd = SAS_GENERATOR_COMMAND.replace('$1', domainFile).replace('$2', problemFile)
            os.system(cmd)

        except:
            raise Exception('Failed to generate SAS file! Check input domain and problem files.')

    except:
        raise Exception('Invalid Input! Usage: >> python main.py <domainfile> <problemfile>')

    debug_flag = '--debug' in sys.argv
    cost_flag  = '--cost' in sys.argv

    # parse SAS data #
    sas_data = readSAS('output.sas', debug_flag)
    [listOfPredicates, initialState, goalState, listOfActions] = sas_data.returnParsedData()
    [compliantConditions, goalCompliantConditions] = sas_data.pre_process(listOfPredicates, listOfActions, goalState)

    # generate transformation #
    Mrref = compute_transform(listOfPredicates, listOfActions, goalCompliantConditions, debug_flag)

    # evaluate #
    evaluation_object = Evaluator(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag)
    print bcolors.HEADER + "\n>> Initial state evaluation = " + bcolors.OKBLUE + str(float(evaluation_object.evaluate(initialState))) + bcolors.ENDC    
    
    # solve #
    plan_object = Planner(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, cost_flag)
    [plan, cost] = plan_object.aStarSearch()

    if plan:    
        print bcolors.HEADER + "\n>> FINAL PLAN\n--> " + bcolors.OKBLUE + '\n--> '.join(plan) + "\n" + bcolors.OKGREEN + "\nCost of Plan: " + str(cost) + '\n' + bcolors.ENDC
    else:
        if cost == 0.0:
            print bcolors.HEADER + "*** NO PLAN REQUIRED ***" + bcolors.ENDC
        else:
            print bcolors.HEADER + "*** NO PLAN FOUND ***" + bcolors.ENDC    
