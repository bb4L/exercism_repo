proc checkValues(q1: (int,int), q2:(int,int))=
    if q1 == q2:
        raise newException(ValueError, "")

    var vals = [q1[0], q1[1], q2[0], q2[1]]

    for k in vals:
        if k < 0 or k > 7:
            raise newException(ValueError, "")

proc canAttack* (q1: (int,int), q2:(int,int)): bool =
    checkValues(q1,q2)
    var d_x = q1[0] - q2[0]
    var d_y = q1[1] - q2[1]
    if d_x == d_y or d_x == -d_y or d_x==0 or d_y==0:
        return true
    false

proc board* (q1: (int,int), q2:(int,int)):seq[string] =
    checkValues(q1,q2)

    for i in countup(0,7):
        var curr_line = ""
        for j in countup(0,7):
            if q1 == (i,j):
                curr_line.add("W")
            elif q2 == (i,j):
                curr_line.add("B")
            else:
                curr_line.add("_")
        result.add(curr_line)