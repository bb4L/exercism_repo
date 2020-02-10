import math

proc sumOfSquares*(n:int):int=
    for k in countup(1,n):
        result += k^2

proc squareOfSum*(n:int):int=
    for k in countup(1,n):
        result += k
    result = result^2

proc difference*(n:int):int=
    squareOfSum(n)-sumOfSquares(n)