import matplotlib.pyplot as plt
SIZES = [1000, 5000, 10000, 50000, 75000, 100000, 500000]
data = []
with open('running_time.txt', 'r') as file:     # Open the file in read mode
    for line in file:
        data.append(int(line.strip()))

titles = ['Random Data', 'Sorted Data', 'Reverse Sorted Data','Nearly Sorted Data', 'Nearly Reverse Sorted Data']
for start in range(0, 5):   # loop on different data orientations (random, sorted, reverse, nearly sorted, nearly reverse)
    # random data
    execution_times_selection_sort = []
    execution_times_insertion_sort = []
    execution_times_merge_sort = []
    execution_times_quick_sort = []
    execution_times_hybrid_sort = []
    for i in range(start, 175, 25): # loop on the size batches (1st batch contains size=1000, ..., up to 7th batch with size=500000), size of each batch is 25
        execution_times_selection_sort.append(data[i])
        execution_times_insertion_sort.append(data[i + 5])
        execution_times_merge_sort.append(data[i + 10])
        execution_times_quick_sort.append(data[i + 15])
        execution_times_hybrid_sort.append(data[i + 20])
    plt.figure(figsize=(10, 6))
    plt.plot(SIZES, execution_times_selection_sort, marker='o', linestyle='-.', color='b', label='Selection Sort')
    plt.plot(SIZES, execution_times_insertion_sort, marker='x', linestyle='--', color='g', label='Insertion Sort')
    plt.plot(SIZES, execution_times_merge_sort, marker='*', linestyle='-', color='r', label='Merge Sort')
    plt.plot(SIZES, execution_times_quick_sort, marker='H', linestyle=':', color='c', label='Quick Sort')
    plt.plot(SIZES, execution_times_hybrid_sort, marker='D', linestyle='-.', color='m', label='Hybrid Sort')
    plt.xlabel('Input Size')
    plt.ylabel('Execution Time (ms)')
    plt.title(titles[start])
    plt.grid(True)
    plt.legend()  # Add a legend to the plot with the label specified
    plt.show()

"""
File structure
--- random data ---
                selection       insertion   merge       quick           hybrid
1000 @:             0,          5,          10,             15,             20
5000 @:             25,         30,         35,             45,             50
10000 @:            50
50000 @:            75
75000 @:            100
100000 @:           125
500000 @:           150

--- sorted data ---
..
..

"""