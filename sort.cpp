#include <bits/stdc++.h>
#include <chrono>
#include <fstream>
using namespace std::chrono;
using namespace std;

enum SortingAlgorithm {
    SELECTION_SORT = 0,
    INSERTION_SORT,
    MERGE_SORT,
    QUICK_SORT,
    HEAP_SORT,
    INTRO_SORT
};

const char* getAlgorithmName(int algo) {
    switch (algo)
    {
        case SELECTION_SORT: return "Selection Sort";
        case INSERTION_SORT: return "Insertion Sort";
        case MERGE_SORT: return "Merge Sort";
        case QUICK_SORT: return "Quick Sort";
        case HEAP_SORT: return "Heap Sort";
        case INTRO_SORT: return "Intro Sort";
        default: return "Unknown Algorithm";
    }
}

// Selection Sort
void selectionSort(vector<int> &arr, size_t size) {
    int cur, idx;
    for (size_t i = 0; i < size; ++i) {
        cur = arr[i];
        idx = i;
        for (int j = i + 1; j < size; j++)
            if (arr[j] < cur)
                cur = arr[j], idx = j;
        swap(arr[i], arr[idx]);
    }
}

// Insertion Sort
void insertionSort(vector<int> &arr, int p, int r) {
    int key, i;
    for (int j = p + 1; j <= r; j++) {
        key = arr[j], i = j - 1;
        while (i >= p && arr[i] > key) {
            arr[i+1] = arr[i];
            --i;
        }
        arr[i+1] = key;
    }
}

// Merge Sort
#define INF 9999999
void merge(vector<int> &arr, size_t p, size_t q, size_t r) {
    int n1 = q - p + 1, n2 = r - q;
    int L[n1+1], R[n2+1];
    for (int i = 0; i < n1; i++) L[i] = arr[p + i];         // p+i spans p+0 = p, up to p+(n1-1) = p+(q-p+1-1) = q
    for (int i = 0; i < n2; i++) R[i] = arr[(q + 1) + i];   // (q+1)+i spans (q+1)+0 = q+1, up to (q+1)+(n2-1) = (q+1)+(r-q-1) = r
    L[n1] = R[n2] = INF;
    int i = 0, j = 0;
    for (int k = p; k <= r; k++) {
        if (L[i] <= R[j])
            arr[k] = L[i], ++i;
        else
            arr[k] = R[j], ++j;
    }
}

void mergeSort(vector<int> &arr, size_t p, size_t r) {
    if (p < r) {
        int q = p + (r - p) / 2;    // the index about which we will divide the array
        mergeSort(arr, p, q);
        mergeSort(arr, q+1, r);
        merge(arr, p, q, r);
    }
}

// Quick Sort
// Set stack size (for example, to 128 MB)    // this was achieved instead during compilation
// #pragma comment(linker, "/STACK:134217728")

int partition(vector<int> &arr, const int &p, const int &r) {
    int x = arr[r];
    int i = p - 1;
    for (int j = p; j < r; ++j) {
        if (arr[j] <= x) {
            ++i;
            swap(arr[i], arr[j]);
        }
    }
    swap(arr[i+1], arr[r]);
    return i + 1;
}

void quickSort(vector<int> &arr, const int &p, const int &r) {
    if (p < r) {
        int q = partition(arr, p, r);
        quickSort(arr, p, q-1);
        quickSort(arr, q+1, r);
    }
}

// Heap Sort

#define left(i) ((i << 1) + 1)
#define right(i) ((i << 1) + 2)
#define parent(i) ((i - 1) >> 1)

void max_heapify(vector<int> &arr, int i, int size) {
    int l = left(i), r = right(i);
    int largest = i;
    if (l < size && arr[l] > arr[largest])
        largest = l;
    if (r < size && arr[r] > arr[largest])
        largest = r;
    if (largest != i) {
        swap(arr[i], arr[largest]);
        max_heapify(arr, largest, size);
    }        
}

void build_max_heap(vector<int> &arr, int p, int r) {
    // int n = arr.size();
    int n = r - p + 1;
    for (int i = (n / 2) - 1; i >= 0; --i) {    // we don't need to check the leafs as we know already they don't have any children
        max_heapify(arr, p + i, n);
    }
}

void heapSort(vector<int> &arr, int p, int r) {
    build_max_heap(arr, p, r);
    int heap_size = r - p + 1;
    for (int i = r; i > p; --i) {
        swap(arr[p], arr[i]);
        --heap_size;
        max_heapify(arr, p, heap_size);
    }
}

// Intro Sort

void introSortUtil(vector<int> &arr, size_t depth, int p, int r) {
    int n = r - p + 1;
    if (n < 16)
        insertionSort(arr, p, r);
    else if (depth == 0)
        heapSort(arr, p, r);
    else {
        int q = partition(arr, p, r);
        introSortUtil(arr, depth - 1, p, q - 1);
        introSortUtil(arr, depth - 1, q + 1, r);
    }
}

void introSort(vector<int> &arr) {
    int maxDepth = log2(arr.size()) * 2;
    introSortUtil(arr, maxDepth, 0, arr.size() - 1);
}

int main(int argc, char *argv[]) {
    
    // reading command line arguments
    int algorithm = atoi(argv[1]);
    string inputFile = argv[2];
    string outputFile = argv[3];
    string statsFile = argv[4];
    
    // reading input data
    vector<int> arr;
    int x, n = 0;
    std::ifstream fin(inputFile);
    if (fin.is_open())
        while (fin >> x)
            arr.emplace_back(x), n++;
    fin.close();

    // time calculation variables
    high_resolution_clock::time_point start;
    high_resolution_clock::time_point stop;

    // running the selected algorithm
    switch (algorithm) {
        case 0: {
            start = high_resolution_clock::now();
            selectionSort(arr, n);
            stop = high_resolution_clock::now();
            break;
        }
        case 1: {
            start = high_resolution_clock::now();
            insertionSort(arr, 0, n-1);
            stop = high_resolution_clock::now();
            break;
        }
        case 2: {
            start = high_resolution_clock::now();
            mergeSort(arr, 0, n-1);
            stop = high_resolution_clock::now();
            break;
        }
        case 3: {
            start = high_resolution_clock::now();
            quickSort(arr, 0, n-1);
            stop = high_resolution_clock::now();
            break;
        }
        case 4: {
            start = high_resolution_clock::now();
            heapSort(arr, 0, n-1);
            stop = high_resolution_clock::now();
            break;
        }
        case 5: {
            start = high_resolution_clock::now();
            introSort(arr);
            stop = high_resolution_clock::now();
            break;
        }
        default: {
            start = high_resolution_clock::now();
            quickSort(arr, 0, n-1);
            stop = high_resolution_clock::now();
            break;
        }
    }

    std::ofstream fout;

    // writing data to output file
    fout.open(outputFile);
    if(fout.is_open()) {
        for (int i = 0; i < n; i++) {
            fout << arr[i] << " ";
        }
    } else {
        std::cerr << "failed to open output file\n";
    }
    fout.close();

    // time stats
    auto duration = duration_cast<milliseconds>(stop - start);
    cout << getAlgorithmName(algorithm) << " took " << duration.count() << " ms" << endl;

    // writing stats
    fout.open(statsFile, std::ios::app);
    if(fout.is_open()) {
        fout << duration.count() << '\n';
    } else {
        std::cerr << "failed to open statistics file\n";
    }
    fout.close();
    return 0;
}