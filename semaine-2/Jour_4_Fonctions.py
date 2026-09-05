# Cours sur les Fonctions en Python

def ranking_of_delays(delay):
    if delay <= 0:
        return "On-Time Flight"
    elif delay < 18:
        return "Slight delay, no compensation"  # léger retard, pas de compensation
    elif delay >= 20 and delay <= 40:
        return "Moderate delay, right to refreshments" # retard modéré
    else :
        return "Significant delay, right to financial compensation" # retard important

Flights_Delay = [12, 8, 9, 20, 17, 46, 14, 36]

for delay in Flights_Delay :
    resultat = ranking_of_delays(delay)
    print(resultat)