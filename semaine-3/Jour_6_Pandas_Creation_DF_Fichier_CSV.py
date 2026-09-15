#Creation d'un Data Frame à partir d'un fichier.csv sur les retards aériens
import pandas as pd

df = pd.read_csv("FlightDelays.csv")

print(df.head())
