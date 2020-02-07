import sequtils, strutils
proc toRna*(dna:string):string =
    var rna: seq[string]

    for dna_nuc in dna:
        case dna_nuc:
        of 'G':
            rna.add("C")
        of 'C':
            rna.add("G")
        of 'T':
            rna.add("A")
        of 'A':
            rna.add("U")
        else:
            raise newException(ValueError, "value Error")
    rna.join