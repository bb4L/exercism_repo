proc distance*(dna1:string="", dna2=""):int64 =
    if dna1.len != dna2.len: raise newException(ValueError,"")
    result = 0
    for index, item in dna1.pairs:
        if(item != dna2[index]): result = result+1