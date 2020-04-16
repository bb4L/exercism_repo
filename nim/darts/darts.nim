import math

type Point = tuple[x:float, y:float]

proc size*(this:Point): float =
    sqrt(this.x^2 + this.y^2)

proc score* (point:Point): int = 
    var r = point.size
    if r > 10:
        0
    elif r > 5:
        1
    elif r > 1:
        5
    else:
        10

# import math

# const
#   OUTSIDE = 0
#   OUTER_CIRCLE = 1
#   MIDDLE_CIRCLE = 5
#   INNER_CIRCLE = 10

# proc getDistance(x: float, y: float): float =
#   math.sqrt(x*x+y*y)
# proc score*(point: tuple[x: float, y: float]): int =
#   let distance = getDistance(point.x, point.y)
#   if distance <= 1:
#     INNER_CIRCLE
#   elif distance <= 5:
#     MIDDLE_CIRCLE
#   elif distance <= 10:
#     OUTER_CIRCLE
#   else:
#     OUTSIDE