import strutils, sequtils
const NonAlpha = AllChars - Letters - Whitespace - Digits
const lowercases = {'a'..'z'}.toSeq

proc handleChars(chars:seq[char]): string =
    (chars.map(proc(x:char):string = 
        if x in Whitespace:
            ""
        elif x in Digits:
            $x
        else:
            $lowercases[25 - find(lowercases, x)])).join
            
proc prepChars(input:string): seq[char]=
    var val = input.strip(chars=NonAlpha, leading=true).strip(chars=NonAlpha, leading=false).toLower()
    val = val.multiReplace(NonAlpha.mapIt(($it, " ")))
    toSeq(val.items)

proc encode*(input:string): string =
    var str = handleChars(prepChars(input))
    
    for x in countdown(str.len div 5,1):
        str.insert(" ", 5*x)

    result = str.strip(chars={' '}, leading=false).strip(chars={' '}, leading=true)

proc decode*(input:string): string =
    handleChars(prepChars(input))


# https://exercism.io/tracks/nim/exercises/atbash-cipher/solutions/f27a9129ea3047e9a18ca8e41472584b

# import strutils, std/wordwrap

# proc decode*(input: string): string =
#     let input = input.toLower
#     for c in input:
#       if c.isDigit: result.add(c)
#       elif c.isAlphaAscii: result.add(chr(219 - ord(c)))
  
#   proc encode*(input: string): string =
#     wrapWords(s = decode(input), maxLineWidth = 5, newLine = " ")