import math, strutils

proc encrypt* (data:string): string =
    var d = data.toLower().split(seps=AllChars-Letters-Digits).join("")
    
    var len = d.len
    if len == 0:
        return ""
    
    var root = sqrt(len.toFloat)
    var r = root.round.toInt
    var c = r
    
    if r*r < len:
        c = r+1
    
    var s: seq[string]
    
    for i in countup(0, r-1):
        s.add(d.substr(i*c, i*c+c))
    
    if s[^1].len < c:
        let reps = c- s[^1].len
        s[^1].add(" ".repeat(reps))
    
    for i in countup(0,c-1):
        for j in countup(0,r-1):
            result.add($s[j][i])
        if i != c-1:
            result.add(" ")
    

# import strutils, sequtils, math

# proc encrypt*(plain: string): string =
#   var
#     normal = plain.toLower.filterIt(it in (Letters + Digits)).join
#     r = int(normal.len.float.sqrt + 0.5)
#     c = if r ^ 2 < normal.len: r + 1 else: r
#   if r < 2:
#     return normal
#   normal.add repeat(' ', c * r - normal.len)
#   for i in 0..<c:
#     if result.len > 0: result.add ' '
#     for j in 0..<r:
#       result.add normal[j * c + i]