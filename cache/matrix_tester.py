from sympy import pprint
import sys
sys.displayhook = pprint
from sympy.matrices import *
A = Matrix([[1,2], [3,4]])
print A
B = A.rref()
print B
