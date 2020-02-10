import sequtils, algorithm
type
    Student* = tuple[name: string, grade: int]
    School* = object
      students*: seq[Student]

proc roster*(this:School):seq[string]=
    var k = this.students
    k.sort do (x, y: Student) -> int:
        result = cmp(x.grade, y.grade)
        if result == 0:
            result = cmp(x.name, y.name)
    result = k.map(proc(s:Student):string = s.name)

proc grade*(this:School, number:int): seq[string] =
    var k = this.students
    k.keepIf(proc(s:Student):bool = s.grade==number)
    k.sort do (x,y:Student) -> int:
        result = cmp(x.name, y.name)
    result = k.map(proc(s:Student):string = s.name)

