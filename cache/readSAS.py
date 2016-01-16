import os, sys, copy

def readSAS(sas_file):
    varList = []
    operatorList = []
    initState = []
    goalState = []
    operatorList = []
    f = open(sas_file,'r')
    readVariables = False
    readInitState = False
    readGoalState = False
    readOperators = False
    while True:
        line = f.readline().split('\n')[0]
        if not line: break

        if readVariables:
            if 'end_variable' in line:
                readVariables = False
            else:
                newVar = []
                newVar.append(line)
                f.readline()
                f.readline()
                newVar.append([f.readline().split('\n')[0], f.readline().split('\n')[0]])
                varList.append(newVar)

        if readInitState:
            if 'end_state' in line:
                readInitState = False
            else:
                initState.append(int(line))
                goalState = copy.deepcopy(initState)
                
        if readGoalState:
            if 'end_goal' in line:
                readGoalState = False
            else:
                temp = line.split('\n')
                temp = line.split(' ')
                goalState[int(temp[0])] = int(temp[1])
            
        if readOperators:
            if 'end_operator' in line:
                readOperators = False
            else:
                newOperation = []
                newOperation.append(line)
                f.readline()
                ops = int(f.readline().split('\n')[0])
                effList = []
                for i in range(ops):
                    temp = f.readline().split('\n')[0].split(' ')
                    effList.append(['var'+temp[1], temp[2], temp[3]])
                newOperation.append(effList)
                newOperation.append(int(f.readline().split('\n')[0]))
                operatorList.append(newOperation)

        if 'begin_variable' in line:
            readVariables = True

        if 'begin_state' in line:
            readInitState = True

        if 'begin_goal' in line:
            readGoalState = True
            f.readline()

        if 'begin_operator' in line:
            readOperators = True

    print varList
    print initState
    print goalState
    print operatorList

if __name__ == '__main__':
    readSAS('output.sas')
