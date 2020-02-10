import times
var giga_second = initTimeInterval(seconds=1.0e9.toInt())

proc addGigasecond*(date:DateTime): DateTime=
    return date + giga_second