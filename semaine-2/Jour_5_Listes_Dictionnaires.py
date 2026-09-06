flights = [
    {"airline": "Easy Jet", "delay": 29, "complete": False},
    {"airline": "Ryannair", "delay": 17, "complete": False},
    {"airline": "Turkish Airlines", "delay": 66, "complete": True}
]


for flight in flights :
    print(f"The {flight['airline']} flight has a delay of {flight['delay']} minutes.")
    if flight['complete'] :
        print("This flight is full.")