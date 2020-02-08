import strutils, tables, sequtils
# proc countWords*(sentence:string): TableRef[string,int] =
#     var words: seq[string] = sentence.split({' ','\t','\n',','})
#     result = TableRef[string,int]()
#     for w in words:
#         var word = w.toLower()
#         word.removePrefix({'\''})
#         word.removeSuffix({'\''})
#         word = word.multiReplace([(" ",""),("`",""),(",",""),(".",""),("!",""),("?",""),("\"",""), ("[",""),("]",""),(":",""),(";",""),("{",""),("}",""),("&",""),("@",""),("$",""),("%",""),("^","")])
#         if word.len > 0:
#             if result.hasKeyOrPut(word,1):
#                 result[word] = result[word] + 1
const NonAlphaNum = AllChars - Letters - Digits
proc countWords*(s: string): CountTable[string] =
    let words = s.replace(",", " ").toLowerAscii().splitWhitespace()
    words.mapIt(it.strip(chars = NonAlphaNum)).toCountTable()