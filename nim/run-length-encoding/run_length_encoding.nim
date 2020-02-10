import strutils
proc encode*(data:string):string = 
    if data == "": 
        return ""
    var curr_char:char = '\t'
    var curr_int:int = 0
    for character in data:
        if curr_char == '\t':
            curr_char = character
        if curr_char!=character:
            if curr_int>1:
                result.add($curr_int)
            result.add(curr_char)
            curr_char = character
            curr_int = 0
        inc(curr_int)

    if curr_int>1:
        result.add($curr_int)
    result.add(curr_char)
    curr_int = 0

proc decode*(data:string):string = 
    var times = 0

    for character in data:
        if character in Digits:
            if times>0:
                times = times*10 
            times = times + parseInt($character)
        elif times>0:
            result.add(character.repeat(times))
            times = 0
        else:
            result.add(character)