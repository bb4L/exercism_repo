import sequtils

proc check_if_modulo*(num: int, dividable:seq[int]):bool=
    result = false
    for x in dividable:
        if num mod x == 0:
            return true

proc sum*(number:int, dividable:seq[int]):int= 
    var s = toSeq(countup(0,number-1))
    var k = dividable
    k.keepIf(proc (x:int):bool = return x!=0)
    
    s.keepIf(proc (x:int):bool =
        check_if_modulo(x,k))
    if(s.len>0):
        result = s.foldl(a+b)
    else:
        result = 0
    
