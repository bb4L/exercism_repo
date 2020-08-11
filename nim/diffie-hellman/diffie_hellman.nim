import random, math

proc privateKey*(p:int):int = 
    randomize()
    return rand(2..p-1)

proc publicKey*(p:int64, g:int64, privatekey:int64):int64 = 
    return int64(pow(float64(g),float64(privatekey))) mod p

proc secret*(p:int64, publickey:int64, privatekey:int64):int64 = 
    return int64(pow(float64(publickey),float64(privatekey))) mod int64(p)