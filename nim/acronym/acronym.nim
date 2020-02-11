import strutils, sequtils

proc handle_value(x:string):string = 
    var k = ""
    try:
        k = ($(x.strip(chars=AllChars-Letters, trailing=true, leading=true).strip()[0])).toUpper.join
    except:
        k = ""
    finally:
        return k

proc abbreviate*(input:string):string =
    if input.len>0:
        return input.split(seps=AllChars-Letters-{'\''}).map(proc (x:string):string= handle_value(x)).join
    ""
    

    # import
    #     re, sequtils, strutils
      
    #   proc abbreviate*(phrase: string): string =
    #     let words = phrase.findall(re"[A-Z]+['a-z]*|['a-z]+")
    #     words.mapIt(it[0].toUpperAscii).join

    # import strutils

    # proc abbreviate*(letter: string): string =
    #   for word in letter.split({' ', '-', '_'}):
    #     if word.len() > 0:  
    #       result.add(word[0].toUpperAscii())