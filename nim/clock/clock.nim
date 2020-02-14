type
    Clock = tuple[hours: int, minutes: int]

proc getString(number:int):string =
    if number < 10:
        result.add("0")
    result.add($number)

proc toStr*(this:Clock):string = 
    result.add(getString(this.hours))
    result.add(":")
    result.add(getString(this.minutes))


proc correctValues(this:Clock): Clock = 
    result = this

    if(result.minutes > 59 or result.minutes < 0):
        let count = result.minutes div 60
        result.minutes = result.minutes mod 60
        result.hours += count

        if result.minutes < 0:
            dec(result.hours)
            result.minutes = 60 + result.minutes
        
    result.hours = result.hours mod 24

    if result.hours < 0:
        let count = result.hours mod 24
        result.hours = 24 + count

proc add*(this:Clock, minutes:int): Clock = 
    result = this
    result.minutes += minutes
    result = correctValues(result)

proc subtract*(this:Clock, minutes:int): Clock = 
    result = this
    result.minutes -= minutes
    result = correctValues(result)

proc create*(c:Clock): Clock=
    correctValues(c)
    
    # import strformat

    # type
    #     Clock = tuple
    #         hour: int
    #         minute: int
    
    # const minutesPerDay = 24 * 60
    
    # func toStr*(clock: Clock): string =
    #     result = &"{clock.hour:02}:{clock.minute:02}"
    
    # func create*(clock: Clock): Clock =
    #     let (hour, min) = clock
    #     var total = (hour * 60 + min) mod minutesPerDay
    #     if total < 0:
    #         total.inc minutesPerDay
    #     result = (hour: total div 60, minute: total mod 60)
    
    # func add*(clock: Clock, minute: int): Clock =
    #     result = create((clock.hour, clock.minute + minute))
    
    # func subtract*(clock: Clock, minute: int): Clock =
    #     result = create((clock.hour, clock.minute - minute))