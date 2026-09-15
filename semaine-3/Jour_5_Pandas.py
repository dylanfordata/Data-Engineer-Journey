#Exercice avec la bibliothèque Pandas (Chargement du package et création d'un data frame)
import pandas as pd

flights = {"Airline": ["Air France", "Turkish Airlines", "Lufthansa", "Japan Airlines"]
           ,
           "Flight Number": ["AF2563", "TK8250", "LH2099", "JA7467"]}

df_flights = pd.DataFrame(flights)
print(df_flights)