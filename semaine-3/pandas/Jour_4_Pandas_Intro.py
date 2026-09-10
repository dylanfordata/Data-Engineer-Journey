# Introduction à Pandas (script python)

import pandas as pd

df = pd.read_csv("aeroports.csv")
print(df.head())

print(df.info())
print(df.describe())