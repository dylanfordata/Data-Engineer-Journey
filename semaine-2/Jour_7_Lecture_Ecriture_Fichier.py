with open("todays_flights.txt", "w") as flight:
    flight.write("Volotea - Delay for 14 minutes\n")
    flight.write("Air France - Delay for 8 minutes\n")
    flight.write("Turkish Airlines - Delay for 29 minutes\n")
    flight.write("Air Dolomiti - Delay for 7 minutes\n")
    flight.write("Iberia - Delay for 11 minutes\n")
    flight.write("Brussels Airlines - Delay for 22 minutes\n")
    flight.write("United Airlines - Delay for 6 minutes\n")
    flight.write("China Eastern Airlines - Delay for 47 minutes\n")
    flight.write("Saudia- Delay for 9 minutes\n")
    flight.write("Air Algerie - Delay for 53 minutes\n")

with open("todays_flights.txt", "r") as flight :
    content = flight.read()
    print(content)