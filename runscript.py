import sys
import random
data_count = int(sys.argv[1])
out_file = sys.argv[2]
with open(out_file, "w") as file:
    for i in range(data_count):
        randint = random.randint(1, 1000000)
        line = str(randint) + '\n'
        file.write(line)