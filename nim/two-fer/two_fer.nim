proc twoFer*(name: string = ""):string =
    if name.len>0:
        result = "One for " & name & ", one for me."
    else:
        result = "One for you, one for me."