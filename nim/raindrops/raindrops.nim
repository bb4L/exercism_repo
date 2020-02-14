proc convert* (number: int): string =
    if number mod 3 == 0:
        result.add("Pling")
    if number mod 5 == 0:
        result.add("Plang")
    if number mod 7 == 0:
        result.add("Plong")
    if result.len == 0:
        result = $number

        # proc convert*(x: Natural): string =
        #     var raindrops = ""
            
        #     proc appendIfFactor(factor: Natural, drop: string) =
        #       if x mod factor == 0:
        #         raindrops &= drop
          
        #     appendIfFactor(3, "Pling")
        #     appendIfFactor(5, "Plang")
        #     appendIfFactor(7, "Plong")
          
        #     if raindrops == "":
        #       $x
        #     else:
        #       raindrops