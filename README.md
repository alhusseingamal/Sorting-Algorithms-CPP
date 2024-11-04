# Sorting-Algorithms-CPP
Implementation of different sorting algorithms in C++

## Files
1. sort.cpp
   The main file containing the Algorithm implementaions.  
2. generate_lists.py
   Generates 5 lists of array data shapes: random, sorted, reverse sorted, nearly sorted, nearly reverse sorted
3. run_script.py
   A simplified generator that 
4. generate_results.py  
   imports the results obtained in the running_time.txt file and uses them to produce graphical representation of the results.
5. Makefile
   contains various make commands that help you run the file:
   1. generate x=<LIST_SIZE> : generates list of random integers of size <LIST_SIZE>, and exports the results to a file: random.txt  
   2. generateAll x=<LIST_SIZE> : generates 5 lists corresponding to the 5 data shapes aforementioned, and exports them to the files: random.txt, sorted.txt, reverse.txt, nearly_sorted.txt, nearly_reverse.txt
   3. build: normal build of the file, extending the stack space (the extra stack space is needed as QuickSort needs large stack space for n > 1000)
   4. release: optimized build of the file, extending the stack space
   5. run algo=<ALGORITHM_NUMBER> : run the sorting algorithm number $(algo) on the random list.
   6. clean: cleans the directory of .txt and .exe files
   7. runAllAcrossRandom: runs all algorithms across all sizes of random data input
   8. runAcrossAll algo=<ALGORITHM_NUMBER>: run certain algorithm across all data input shapes.
   9. runAllAcrossAll : runs all algorithms across all sizes of the 5 input data orientations

## How to run
In this example, we will build an optimized version, generate 5 lists of size 100, and run algorithm number 5 (which is IntroSort) across all of them:
1. make release
2. make generateAll x=100
3. make runAcrossAll algo=5

Another Example: we run and generate results (graphs). this may take some time. You can alter the list sizes (the array called SIZES) in the Makefile and the generateResults file if you need it to finish faster:
1. make release
2. make runAllAcrossAll
3. make generateResults
