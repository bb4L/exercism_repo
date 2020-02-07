import strutils
proc isPangram*(input:string):bool =
    var chars = set[char]({})

    for i in input:
        var val: char = toLowerAscii(i)
        case ord(val)
        of 97..(97+26):
            chars.incl(val)
        else: continue
        if chars.len == 26:
            return true
    false