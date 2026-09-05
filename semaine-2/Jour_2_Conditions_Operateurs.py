# Cours sur les Conditions et Opérateurs dans le langage 

delay_minutes = 90 #Ici on définit notre variable sur le retard en minutes

if delay_minutes <= 0:
    print("On-Time Flight")     # Vol à l'heure si le retard est de 0 minutes ou moins
elif delay_minutes < 15:
    print("Minor delay, no compensation")     # Un léger retard mais pas de compensation
elif delay_minutes >= 15 and delay_minutes <= 60:
    print("Moderate delay, no compensation")     #  Si le retard est modéré, un droit à un rafraîchissement est possible
else:
    print("Significant delay, right to financial compensation")     # Retard important, droit à une compensation financière
