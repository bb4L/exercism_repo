import tables, sequtils, strutils

const nucleoids = ['A','C','G','T']

proc countDna* (dna: string): CountTable[char] = 
    var dna_seq = toSeq(dna.toUpper().items)
    if(any(dna_seq , proc (x:char):bool= not(x in nucleoids) )):
        raise newException(ValueError, "invalid nucleoid")
    dna_seq.toCountTable()