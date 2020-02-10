import strutils, math

proc isArmstrongNumber*(number:int):bool=
    var sum = 0f
    var str_num = $number
    for character in str_num:
        sum += parseFloat($character).pow(str_num.len.toFloat())
    sum.toInt()==number