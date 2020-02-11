proc one_step(n:int):int =
    if n mod 2 == 0:
        n div 2
    else:
        3*n + 1

proc steps*(n:int): int =
    if n < 1:
        raise newException(ValueError,"")
    var count = 0
    var k = n

    while k > 1:
        k = one_step(k)
        inc(count)
    count