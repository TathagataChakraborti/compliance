#!/usr/bin/python
import os, sys, copy
from problem_class import Problem 
from Planner import Planner
from Evaluator import Evaluator
from readSAS import readSAS
from readPDDL import readPDDL
from matpy import compute_transform
from utils import bcolors

SAS_GENERATOR_COMMAND = "rm -f output.sas && ~/Desktop/FAST-DOWNWARD/src/translate/translate.py $1 $2 > stdout.txt"
PR2PLAN_COMMAND       = "rm -f pr-domain.pddl pr-problem.pddl && ~/pr2plan -d $1 -i $2 -o obs.dat > stdout.txt"

### main function ###

if __name__ == '__main__':
    
    debug_flag    = '--debug' in sys.argv
    cost_flag     = '--cost' in sys.argv

    try:

        print bcolors.HEADER + '\n>> Reading data' + bcolors.ENDC

        domainFile  = sys.argv[1]
        problemFile = sys.argv[2]
        
        if '--sas' in sys.argv:
            
            try:
                
                cmd = SAS_GENERATOR_COMMAND.replace('$1', domainFile).replace('$2', problemFile)
                os.system(cmd)
                grounded_data = readSAS('output.sas', debug_flag)
                
            except:
                raise Exception('Failed to generate SAS file! Check input domain and problem files.')

        else:

            try:
                
                cmd = PR2PLAN_COMMAND.replace('$1', domainFile).replace('$2', problemFile)
                os.system(cmd)

                domainFile  = 'pr-domain.pddl'
                problemFile = 'pr-problem.pddl'

                temp = ''
                with open(domainFile, 'r') as tempFile:
                    for line in tempFile:
                        if 'EXPLAIN' not in line:
                            temp += line

                with open(domainFile, 'w') as tempFile:
                    tempFile.write(temp)

                temp = ''
                with open(problemFile, 'r') as tempFile:
                    for line in tempFile:
                        if 'EXPLAIN' not in line:
                            temp += line

                with open(problemFile, 'w') as tempFile:
                    tempFile.write(temp)

                grounded_data = readPDDL(domainFile, problemFile, debug_flag)

            except:
                raise Exception('Failed to generate grounded files.')

    except:
        raise Exception('Invalid Input! Usage: >> python main.py <domainfile> <problemfile>')


    try:
        if sys.argv[3].strip() == '-h':
            heuristicName = sys.argv[4].strip()
            print 
        else:
            raise Exception('Invalid Input! Usage: >> python main.py <domainfile> <problemfile> -h <heuristic_name>')
    except:
        heuristicName = 'equality'
        print bcolors.OKGREEN + "--> Default heuristic 'equality'" + bcolors.ENDC

    # parse SAS/PDDL data #
    listOfPredicates, initialState, goalState, listOfActions, compliantConditions, goalCompliantConditions = grounded_data.returnParsedData()

    # generate transformation #
    Mrref, M = compute_transform(listOfPredicates, listOfActions, goalCompliantConditions, debug_flag)

    # evaluate #
    evaluation_object = Evaluator(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag)
    print bcolors.HEADER + "\n>> Initial state evaluation = " + bcolors.OKBLUE + str(float(evaluation_object.evaluate(initialState, heuristicName))) + bcolors.ENDC    
    sys.exit(0)
    
    # solve #
    plan_object = Planner(listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mrref, M, cost_flag)
    plan, cost  = plan_object.aStarSearch(heuristicName)

    if plan:    
        print bcolors.HEADER + "\n>> FINAL PLAN\n--> " + bcolors.OKBLUE + '\n--> '.join(plan) + "\n" + bcolors.OKGREEN + "\nCost of Plan: " + str(cost) + '\n' + bcolors.ENDC
    else:
        if cost == 0.0:
            print bcolors.HEADER + "*** NO PLAN REQUIRED ***" + bcolors.ENDC
        else:
            print bcolors.HEADER + "*** NO PLAN FOUND ***" + bcolors.ENDC    
