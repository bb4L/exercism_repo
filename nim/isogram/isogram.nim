import strutils
proc isIsogram*(data:string):bool=
    var chars: set[char] = set[char]({})
    for c in data:
        var character:char = toUpperAscii(c)
        case ord(c)
        of 65..(65+26), 97..(97+26):
            if chars.contains(character):
                return false
        else:
            continue
        chars.incl(character)
    true