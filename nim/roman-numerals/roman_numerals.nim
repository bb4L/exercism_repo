import strutils, tables

const VALUES = {1: ['I', 'V', 'X'], 2: ['X', 'L' , 'C'], 3: ['C', 'D' , 'M'], 4: ['M', 'V', 'V']}.toTable


proc handle_digit*(n:int, vals: array[0..2,char]) : string =
    case n:
        of 0:
            result = ""
        of 1..3:
            result.add(vals[0].repeat(n))
        of 4:
            result = $vals[0]
            result.add(vals[1])
        of 5..8:
            result = $vals[1]
            result.add(vals[0].repeat(n-5))
        else:
            result = $(vals[0].repeat(10-n))
            result.add(vals[2])


proc roman*(n: int):string =
    var str_n = $n
    var digits_count = str_n.len
    for i, val in str_n.pairs:
        result.add(handle_digit(parseInt($val), VALUES[digits_count-i]))
