import sys
import os
import random


def is_int(x):
    try:
        int(x)
        return True
    except ValueError:
        return False

data_count = int(sys.argv[1])
out_file_random = sys.argv[2]
out_file_sorted = sys.argv[3]
out_file_reverse = sys.argv[4]
out_file_nearly_sorted = sys.argv[5]
out_file_nearly_reverse = sys.argv[6]

# generate random list of size data_count
with open(out_file_random, "w") as file:
    for i in range(data_count):
        randint = random.randint(1, 1000000)
        line = str(randint) + '\n'
        file.write(line)

# generate a sorted list of size data_count
with open(out_file_sorted, "w") as file:
    for i in range(data_count): # start at 0, end at data_count-1
        line = str(i) + '\n'
        file.write(line)

# generate a reverse list of size data_count
with open(out_file_reverse, "w") as file:
    for i in range(data_count, 0, -1):   # start, end (exclusive), step
        line = str(i) + '\n'
        file.write(line)


# generate a nearly sorted list of size data_count
swap_factor = 0.1   # the percentage of swapped elements
num_swaps = int(data_count * swap_factor)

lst = [i for i in range(data_count)]
for i in range(num_swaps):  # Make the swaps at random indices
    index1 = random.randint(0, data_count-1)    # inclusive of both
    index2 = random.randint(0, data_count-1)
    lst[index1], lst[index2] = lst[index2], lst[index1]

with open(out_file_nearly_sorted, "w") as file:
    for i in lst:
        line = str(i) + '\n'
        file.write(line)

# generate a nearly reverse list of size data_count
swap_factor = 0.1   # the percentage of swapped elements
num_swaps = int(data_count * swap_factor)

lst = list(range(data_count, 0, -1))
for i in range(num_swaps):  # Make the swaps at random indices
    index1 = random.randint(0, data_count-1)
    index2 = random.randint(0, data_count-1)
    lst[index1], lst[index2] = lst[index2], lst[index1]

with open(out_file_nearly_reverse, "w") as file:
    for i in lst:
        line = str(i) + '\n'
        file.write(line)