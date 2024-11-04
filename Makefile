SIZES = 1000 5000 10000 50000 75000 100000 500000
generate:
	python runscript.py $(x) random.txt

generateAll:
	python generate_lists.py $(x) random.txt sorted.txt reverse.txt nearly_sorted.txt nearly_reverse.txt

build:
	g++ -Wl,--stack,134217728 sort.cpp -o sort.exe

release:
	g++ -O2 -Wl,--stack,134217728 sort.cpp -o sort.exe

run:
	@echo "Running sort.exe with algorithm $(algo)..."
	./sort.exe $(algo) random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }

clean:
	rm -f *.txt
	rm -f *.exe

runAcrossAll:
	@echo "Running sort.exe with algorithm $(algo)..."
	./sort.exe $(algo) random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }
	./sort.exe $(algo) sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }
	./sort.exe $(algo) reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }
	./sort.exe $(algo) nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }
	./sort.exe $(algo) nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }

runAllAcrossRandom:
	@for size in $(SIZES); do \
		echo "Running sort.exe with selection sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 0 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done
	@for size in $(SIZES); do \
		echo "Running sort.exe with insertion sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 1 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done
	@for size in $(SIZES); do \
		echo "Running sort.exe with merge sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 2 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done
	@for size in $(SIZES); do \
		echo "Running sort.exe with quick sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 3 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done
	@for size in $(SIZES); do \
		echo "Running sort.exe with heap sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 4 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done
	@for size in $(SIZES); do \
		echo "Running sort.exe with intro sort across random list of size $$size"; \
		python runscript.py $$size random.txt; \
		./sort.exe 5 random.txt sorted_data.txt running_time_rand.txt || { echo 'Execution failed'; exit 1; }; \
	done

runAllAcrossAll:
    # Clean up
	-@rm running_time.txt || true
	@for size in $(SIZES); do \
		echo "Generating files of size $$size..."; \
        python generate_lists.py $$size random.txt sorted.txt reverse.txt nearly_sorted.txt nearly_reverse.txt; \
        echo "Running Selection Sort..."; \
        ./sort.exe 0 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 0 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 0 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 0 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 0 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        echo "Running Insertion Sort..."; \
        ./sort.exe 1 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 1 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 1 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 1 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 1 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        echo "Running Merge Sort..."; \
        ./sort.exe 2 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 2 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 2 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 2 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 2 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        echo "Running Quick Sort..."; \
        ./sort.exe 3 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 3 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 3 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 3 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 3 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        echo "Running Heap Sort..."; \
        ./sort.exe 4 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 4 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 4 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 4 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 4 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
		echo "Running Intro Sort..."; \
        ./sort.exe 5 random.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 5 sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 5 reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 5 nearly_sorted.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
        ./sort.exe 5 nearly_reverse.txt sorted_data.txt running_time.txt || { echo 'Execution failed'; exit 1; }; \
    done


generateResults:
	python generate_results.py