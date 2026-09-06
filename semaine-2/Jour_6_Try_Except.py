delays = [37, 56, 22, "sensor error", 12, 41]

for delay in delays :
    try:
        result = delay + 5
        print(result)    
    except TypeError:
        print("Error: invalid delay data, calculation impossible.")