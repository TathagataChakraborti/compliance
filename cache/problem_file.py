import copy

class Problem():
    def __init__(self, listOfPredicates, listOfActions, initialState, goalState, compliantConditions, goalCompliantConditions, Mdash):
        self.listOfPredicates        = listOfPredicates
        self.listOfActions           = listOfActions
        self.goalState               = goalState
        self.initialState            = initialState
        self.compliantConditions     = compliantConditions 
        self.goalCompliantConditions = goalCompliantConditions
        self.T                       = Mdash[1][0]
        self.r                       = Mdash[2]
        self.Md                      = Mdash[0][0]
        Y                            = self.Md[:self.r,:]
        self.Z                       = Y.transpose()*(Y*Y.transpose()).inv()

    def getStartState(self):
        return self.initialState

    def getGoalState(self):
        return self.goalState

    def isGoalState(self, state):
        for id in range(len(self.listOfPredicates)):
            if self.goalState[id] == 1:
                if state[id] == 0:
                    return False
        return True

    def getSuccessors(self, state):
        oldState         = state[0]
        currentCost      = state[2]
        listOfSuccessors = []
        for action in self.listOfActions:
            applicable = 1
            for precondition in action[1]:
                applicable *= oldState[self.listOfPredicates.index(precondition)]

            if applicable:
                newState = copy.deepcopy(oldState)
                for effect in action[2]:
                    if 'not' in effect:
                        newState[self.listOfPredicates.index(effect.split(" ")[1])] = 0
                    else:
                        newState[self.listOfPredicates.index(effect)] = 1
                newCost = currentCost + action[3]

                listOfSuccessors.append([newState, action[0], newCost])

        return listOfSuccessors
        

