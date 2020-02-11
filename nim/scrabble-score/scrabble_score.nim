import tables, sequtils, strutils

const one = ['A','E','I','O','U','L','N','R','S','T']
const two = ['D','G']
const three = ['B','C','M','P']
const four = ['F','H','V','W','Y']
const five = ['K']
const eight = ['J','X']
const ten = ['Q','Z']

proc score*(word:string): int =
    result = 0
    var table = toSeq(word.toUpper().items).toCountTable()
    for key, val in table:
        var mult = 0
        if key in one:
            mult = 1
        elif key in two:
            mult = 2
        elif key in three:
            mult = 3
        elif key in five:
            mult = 5
        elif key in eight:
            mult = 8
        elif key in four:
            mult = 4
        elif key in ten:
            mult = 10
        else:
            mult = 0
        result = result + val * mult



# import strutils

# proc scoreFor(letter: char): int =
#   case letter.toUpperAscii()
#   of 'D', 'G': 2
#   of 'B','C','M','P': 3
#   of 'F', 'H', 'V', 'W', 'Y': 4
#   of 'K': 5
#   of 'J', 'X': 8
#   of 'Q', 'Z': 10
#   else:
#     1
# proc score*(word: string): int =
#   for i in word:
#     inc result, scoreFor(i)




# import tables, sequtils, strutils

# const values = toTable {
#     'A', 'E', 'I', 'O', 'U', 'L', 'N', 'R', 'S', 'T': 1,
#     'D', 'G': 2,
#     'B', 'C', 'M', 'P': 3,
#     'F', 'H', 'V', 'W', 'Y': 4,
#     'K': 5,
#     'J', 'X': 8,
#     'Q', 'Z': 10
#   }

# func score*(word: string): int =
#   word.toUpper.foldl(a + values[b], 0)

