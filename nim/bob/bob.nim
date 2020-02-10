import strutils
const NonAlpha = AllChars - Letters

proc hey*(sen:string=""): string =
    var letters = sen.strip(chars=NonAlpha)
    var sentence = sen.strip(chars=Whitespace)
    if (sentence.len == 0):
        return "Fine. Be that way!"
    var normal = sentence
    var is_shouting = normal == sentence.toUpper() and letters.len>0
    var is_question = sentence[^1] == '?'
    
    if is_shouting and is_question:
        return "Calm down, I know what I'm doing!"
    if is_question:
        return "Sure."
    if is_shouting:
        return "Whoa, chill out!"
    "Whatever."