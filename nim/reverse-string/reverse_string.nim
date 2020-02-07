proc reverse*(data:string):string=
    result = ""
    for i in data:
        result = i&result