from sympy import *
import util, copy
import numpy

def astarSearch(problem, flag = False):

    print 'Running A* Search:'
    goalState               = problem.getGoalState()
    T                       = problem.T
    r                       = problem.r
    Z                       = problem.Z
    listOfPredicates        = problem.listOfPredicates
    goalCompliantConditions = problem.goalCompliantConditions
    fringe                  = util.PriorityQueue()
    closed                  = []
    numberOfStatesExpanded  = 0
    fval = heuristic(problem.getStartState(), problem)
    fringe.push([problem.getStartState(), [], 0], fval)
    printloop = 0

    while not fringe.isEmpty():

        if printloop == 300:
            printloop = 0
            print 'Number of States Expanded = ' + str(numberOfStatesExpanded)
        printloop += 1
            
        node = fringe.pop()
        if problem.isGoalState(node[0]):
            print 'Number of States Expanded = ' + str(numberOfStatesExpanded)
            return node
        numberOfStatesExpanded += 1
        res = []
        checkFlag = True

        if node[0] not in closed:
            closed.append(node[0])
            if flag:
                current = zeros(len(goalCompliantConditions),1)
                goal    = zeros(len(goalCompliantConditions),1)
                for idx in range(len(goalCompliantConditions)):
                    current[idx] = node[0][listOfPredicates.index(goalCompliantConditions[idx])]
                    goal[idx]    = goalState[listOfPredicates.index(goalCompliantConditions[idx])]
                d       = (goal - current)
                Td      = T*d
                checkFlag = sum(Td[r+1:]) == 0

            if checkFlag:
                res = problem.getSuccessors(node)
                while len(res) > 0:
                    put = res.pop()
                    if put[0] not in closed:
                        newnode = copy.deepcopy(node)
                        newnode[0] = put[0]
                        newnode[1] = newnode[1] + [put[1]]
                        newnode[2] = put[2] + heuristic(put[0], problem)
                        fringe.push(newnode,newnode[2])

    print 'Number of States Expanded = ' + str(numberOfStatesExpanded)
    return None


def heuristic(state, problem):

    goalState               = problem.getGoalState()
    T                       = problem.T
    r                       = problem.r
    Z                       = problem.Z
    listOfPredicates        = problem.listOfPredicates
    goalCompliantConditions = problem.goalCompliantConditions
    current                 = zeros(len(goalCompliantConditions),1)
    goal                    = zeros(len(goalCompliantConditions),1)
    for idx in range(len(goalCompliantConditions)):
        current[idx] = state[listOfPredicates.index(goalCompliantConditions[idx])]
        goal[idx]    = goalState[listOfPredicates.index(goalCompliantConditions[idx])]
    d   = (goal - current)
    Td  = T*d
    c   = Matrix(Td[:r])
    v   = Z*c
    l1norm = numpy.linalg.norm(v, ord=1)
    return l1norm
