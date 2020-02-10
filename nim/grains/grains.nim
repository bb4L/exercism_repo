import math

proc onSquare*(squareNumber:int):uint64=
    if squareNumber < 1 or squareNumber>64:
        raise newException(ValueError,"")
    2u64^(squareNumber-1)

proc total*():uint64=
    return high(uint64)