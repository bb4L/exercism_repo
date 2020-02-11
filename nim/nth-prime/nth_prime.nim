const first_6 = [2, 3, 5, 7, 11, 13]

proc is_prime(n:int):bool=
    for i in first_6:
        if n mod i == 0:
            return false
    for i in countup(14, (n+1) div 2):
        if n mod i == 0:
            return false
    return true

proc prime*(n:int):int =
    if n < 1:
        raise newException(ValueError,"")
    if n < 7:
        return first_6[n-1]

    var count = 6
    var x = 13
    while count<n:
        inc x
        if is_prime(x):
            inc count
    return x

# proc isPrime(n: int): bool =
#     for m in 2..n:
#         if m * m > n: return true
#         if n mod m == 0: return false
      
# proc prime*(n: int): int =
#     if n < 1: raise newException(ValueError, "n should be positive")
#     if n == 1: return 2
#     if n == 2: return 3
#     let step = 2
#     var count = 2
      
#     result = 3
      
#     while count < n:
#         result += step
#         if isPrime(result): count.inc