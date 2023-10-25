num = 20

def decimalToBinary(n): 
    return bin(n).replace("0b", "") 

for i in range(num): 
    print(decimalToBinary((i*2+1)**2))
