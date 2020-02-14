import sequtils

proc checkVals(values: array[0..2, int]):bool =
    if any(values, proc(x:int):bool = x<=0):
        false
    elif values[0] + values[1] < values[2] or values[2] + values[1] < values[0] or values[0] + values[2] < values[1]:
        false
    elif values[0] + values[1] == values[2] or values[2] + values[1] == values[0] or values[0] + values[2] == values[1]:
        false
    else:
         true

proc isEquilateral*(vals: array[0..2,int]): bool = 
    if not checkVals(vals):
        false
    elif vals[0]==vals[1] and vals[1] == vals[2]:
        true
    else:
        false

proc isIsosceles*(vals: array[0..2,int]): bool =
    if not checkVals(vals):
        return false
    if vals[0] == vals[1] or vals[1]==vals[2] or vals[0]==vals[2]:
        true
    else:
        false

proc isScalene*(vals: array[0..2,int]): bool =
    if not checkVals(vals):
        false
    elif isIsosceles(vals):
        false
    else:
        true




        # import algorithm

        # type Triangle = array[3, int]
        # type TriangleType = enum Illegal, Equilateral, Isosceles, Scalene
        
        # proc getType(triangle: Triangle): TriangleType = 
        #   let 
        #     sortedSides = triangle.sorted(system.cmp[int])
        #     a = sortedSides[0]
        #     b = sortedSides[1]
        #     c = sortedSides[2]
        #   if a <= 0 or (a + b <= c): Illegal
        #   elif a == c: Equilateral
        #   elif a == b or b == c: Isosceles
        #   else: Scalene  
        
        # proc is_equilateral*(triangle: Triangle): bool =
        #   getType(triangle) == Equilateral
        
        # proc is_isosceles*(triangle: Triangle): bool = 
        #   getType(triangle) in [Equilateral, Isosceles]
        
        # proc is_scalene*(triangle: Triangle): bool = 
        #   getType(triangle) == Scalene