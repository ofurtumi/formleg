import sys
nodes = {}

if len(sys.argv) < 2:
    print("Usage: python3 parser.py <file>")
    exit()

with open(sys.argv[1]) as f:
    states = f.read()

def flt(l):
    if l == "" or l == "\n" or l[0] == "/": return False
    return True

lines = list(filter(flt, states.split("\n")))[3:]

for i in range(0, len(lines), 2):
    first = lines[i].split(",")
    second = lines[i+1].split(",")
    if first[0] not in nodes:
        nodes[first[0]] = ({second[0]: f"{first[1]},{second[1]},{second[2]}"})
    else: 
        nodes[first[0]] = (nodes[first[0]], {second[0]: f"{first[1]},{second[1]},{second[2]}"})

for node in nodes:
    print(f"{node}: {nodes[node]}")
