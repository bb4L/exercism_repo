import tables

const FACTORS = [
("Mercury",  0.2408467f),
("Venus",  0.61519726f),
("Earth",  1.0f),
("Mars",  1.8808158f),
("Jupiter",  11.862615f),
("Saturn",  29.447498f),
("Uranus",  84.016846f),
("Neptune",  164.79132f) 
].toTable

const YEAR_SECONDS:float = 31557600

proc age*(planet:string, seconds:int64): float =
    result = seconds.toBiggestFloat / (YEAR_SECONDS * FACTORS[planet])
    echo result