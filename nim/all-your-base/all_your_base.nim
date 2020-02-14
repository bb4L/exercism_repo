import sequtils, math, algorithm

proc convert*(inputDigits:openArray[int], orig_base:int, base:int):seq[int]=
    if (orig_base) < 2 or (any(inputDigits, proc(val:int):bool= val<0 or val>=orig_base)) or (base < 2):
        raise newException(ValueError, "")

    if toSeq(inputDigits.items).len == 0 or all(inputDigits,proc(val: int):bool= val==0 ):
        return @[0]
    
    var exp = toSeq(inputDigits.items).len-1
    var len = toSeq(inputDigits.items).len-1
    var dec_number = 0f

    while exp >= 0:
        dec_number = dec_number + pow(orig_base.toFloat, exp.toFloat) * inputDigits[len-exp].toFloat
        dec exp
    
    var remainders = newSeq[int]()
    var remainder = 1
    var res = dec_number.toInt
    while res > 0 :
        remainder = res mod base
        res = res div base
        remainders.add(remainder)
    reverse(remainders)
    return remainders


#     import math, sequtils

# proc convert*(inputDigits: openArray[int], inputBase, outputBase: int): seq[int] =
#   if inputBase < 2 or
#     outputBase < 2 or
#     inputDigits.anyIt(it < 0) or
#     inputDigits.anyIt(it > inputBase - 1):
#     raise newException(ValueError, "wrong input")

#   var decimal = 0
#   for i, input in inputDigits:
#     let power = inputDigits.len - i - 1
#     decimal += input * inputBase ^ power

#   while decimal > 0:
#     result.insert(decimal mod outputBase, 0)
#     decimal = decimal div outputBase

#   if result.len == 0: return @[0]