# Cours sur les Boucles en Python

Flights_Delay = [12, 8, 9, 20, 17, 46, 14, 36]

for delay in Flights_Delay :
    if delay <= 0:
        print("On-Time Flight")
    elif delay < 18:
        print("Slight delay, no compensation")  # léger retard, pas de compensation
    elif delay >= 20 and delay <= 40:
        print("Moderate delay, right to refreshments") # retard modéré
    else :
        print("Significant delay, right to financial compensation") # retard important

