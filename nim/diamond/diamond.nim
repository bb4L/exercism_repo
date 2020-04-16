import strutils, sequtils

const lowercaseLetters = toSeq 'A'..'Z'

proc getLine(c:char, n:int, total:int): string =
    if n == 0:
        let str = " ".repeat(total)
        str & $c & str
    else:
        " ".repeat(total-n) & ($c) & " ".repeat(2*n-1) & ($c) & (" ".repeat(total-n))

proc diamond* (input:char) : string =
    var d = int(input) - int('A')
    var res: seq[string]
    for i in countup(0, d):
        res.add(getLine(lowercaseLetters[i],i,d))
    
    for i in countdown(d-1, 0):
        res.add(res[i])
    result = res.join("\n") & "\n"


    # import sequtils, strutils

    # proc diamond*(letter: char): string =
    #   let side = (ord(letter) - ord('A')) * 2 + 1
    #   var square = sequtils.repeat(spaces(side), side)
    #   for c in 'A'..letter:
    #     let
    #       charIdx = ord(c) - ord('A')
    #       x1 = int((side - 1) / 2) - charIdx
    #       x2 = int((side - 1) / 2) + charIdx
    #       y1 = charIdx
    #       y2 = side - 1 - charIdx
    #     square[y1][x1] = c
    #     square[y2][x1] = c
    #     square[y1][x2] = c
    #     square[y2][x2] = c
    #   square.join("\n") & "\n"