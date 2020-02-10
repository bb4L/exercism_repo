const ALLERGIES_CONST = [
    "eggs"
    ,"peanuts"
    ,"shellfish"
    ,"strawberries"
    ,"tomatoes"
    ,"chocolate"
    ,"pollen"
    ,"cats"

]

type 
    Allergies* = object
        score*: int

# method isAllergicTo*(t: Allergies, input:string):bool {.base.} =
    # var idx = find(ALLERGIES_CONST, input)
    # echo idx
    # false

proc lst*(this: Allergies): seq[string] =
    for i, allergy in ALLERGIES_CONST:
        if (1 shl i and this.score) != 0:
            result.add(allergy)
            
proc isAllergicTo*(this: Allergies, allergy: string): bool =
    this.lst.contains(allergy)

# proc Allergies*(code:int):seq[string]=
#     var bin_num = code.toBin(8)
#     echo ALLERGIES_CONST
#     for i in bin_num:
#         echo i
#     return @[""]
