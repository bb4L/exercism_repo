import tables, sequtils, strutils


proc val_to_check(value:string): CountTable[char] =
    return toSeq(value.toLower().items).toCountTable()

proc detectAnagrams*(data:string, solutions: seq[string]): seq[string]=
    var counts = val_to_check(data)
    result = seq[string](@[])
    for possible in solutions:
        if counts == val_to_check(possible) and possible.toLower()!=data.toLower():
            result.add(possible)
