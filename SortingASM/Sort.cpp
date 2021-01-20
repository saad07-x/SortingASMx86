#include<iostream>
#include<conio.h>
#include <string.h>
#include<fstream>

using namespace std;



//******************SELECTION SORT**********************
int SelectionSort(){
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);


    for (i = 0; i < n - 1; i++)
    {
        min_idx = i;
        for (j = i + 1; j < n; j++)
            if (arr[j] < arr[min_idx])
                min_idx = j;
        swap(&arr[min_idx], &arr[i]);
    }
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << "  ";
    cout << endl;
}

//******************SELECTION SORT**********************

int partition(int arr[], int low, int high){
    int pivot = arr[high];
    int i = (low - 1);

    for (int j = low; j <= high - 1; j++)
    {

        if (arr[j] < pivot)
        {
            i++;
            swap(&arr[i], &arr[j]);
        }
    }
    swap(&arr[i + 1], &arr[high]);
    return (i + 1);
}
void quickSort(int arr[], int low, int high)
{
    if (low < high)
    {

        int pi = partition(arr, low, high);


        quickSort(arr, low, pi - 1);
        quickSort(arr, pi + 1, high);
    }
}
int QuickSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    quickSort(arr, 0, n - 1);
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << "  ";
    cout << endl;

}

//******************INSERTION SORT**********************
void insertionSort(int arr[], int n)
{
    int i, key, j;
    for (i = 1; i < n; i++)
    {
        key = arr[i];
        j = i - 1;

        while (j >= 0 && arr[j] > key)
        {
            arr[j + 1] = arr[j];
            j = j - 1;
        }
        arr[j + 1] = key;
    }
}
int InsertionSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    insertionSort(arr, n);
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;

}

//******************COMB SORT**********************
int getNextGap(int gap)
{
    gap = (gap * 10) / 13;

    if (gap < 1)
        return 1;
    return gap;
}

void combSort(int a[], int n)
{

    int gap = n;

    bool swapped = true;

    while (gap != 1 || swapped == true)
    {

        gap = getNextGap(gap);

        swapped = false;


        for (int i = 0; i < n - gap; i++)
        {
            if (a[i] > a[i + gap])
            {
                swap(a[i], a[i + gap]);
                swapped = true;
            }
        }
    }
}
int CombSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    combSort(arr, n);

    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;

}

//******************BUBBLE SORT**********************
int BubbleSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);


    for (i = 0; i < n - 1; i++)

        for (j = 0; j < n - i - 1; j++) {
            if (arr[j] > arr[j + 1]) {
                swap(&arr[j], &arr[j + 1]);
            }
        }
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;

}


//******************SHELL SORT**********************
int shellSort(int arr[], int n)
{
    for (int gap = n / 2; gap > 0; gap /= 2)
    {

        for (int i = gap; i < n; i += 1)
        {

            int temp = arr[i];


            int j;
            for (j = i; j >= gap && arr[j - gap] > temp; j -= gap)
                arr[j] = arr[j - gap];
            arr[j] = temp;
        }
    }
    return 0;
}
int ShellSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    shellSort(arr, n);
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;

}


//******************HEAP SORT**********************
void heapify(int arr[], int n, int i)
{
    int largest = i;
    int l = 2 * i + 1;
    int r = 2 * i + 2;


    if (l < n && arr[l] > arr[largest])
        largest = l;


    if (r < n && arr[r] > arr[largest])
        largest = r;


    if (largest != i) {
        swap(arr[i], arr[largest]);


        heapify(arr, n, largest);
    }
}
void heapSort(int arr[], int n)
{
    for (int i = n / 2 - 1; i >= 0; i--)
        heapify(arr, n, i);

    for (int i = n - 1; i > 0; i--) {
        swap(arr[0], arr[i]);

        heapify(arr, i, 0);
    }
}
int HeapSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    heapSort(arr, n);

    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;



}

//******************MERGE SORT**********************
void Merge(int arr[], int i, int m, int j)
{
    int l = i;
    int r = m + 1;
    int k = i;
    int aux[10];
    while ((l <= m) && (r <= j)) {
        if (arr[l] < arr[r]) {
            aux[k] = arr[l];
            l++;
            k++;
        }
        else {
            aux[k] = arr[r];
            r++;
            k++;
        }
    }

    while (l <= m) {
        aux[k] = arr[l];
        l++;
        k++;
    }

    while (r <= j) {
        aux[k] = arr[r];
        r++;
        k++;
    }

    for (k = i; k <= j; k++) {
        arr[k] = aux[k];
    }
}

void mergeSort(int arr[], int i, int j)
{
    if (i == j)
        return;
    int m = (i + j) / 2;
    mergeSort(arr, i, m);
    mergeSort(arr, m + 1, j);
    Merge(arr, i, m, j);
}
int MergeSort() {
    int arr[10];
    int i, j, min_idx;
    cout << "Enter 10 elements in the array: ";
    for (i = 0; i < 10; i++) {
        cin >> arr[i];
    }
    int n;
    n = sizeof(arr) / sizeof(arr[0]);
    mergeSort(arr, 0, n - 1);
    cout << "Printing the array: ";
    for (i = 0; i < n; i++)
        cout << arr[i] << " ";
    cout << endl;
}

//******************SWAP FUNCTION**********************
void swap(int* xp, int* yp) {
    int temp = *xp;
    *xp = *yp;
    *yp = temp;
}

int mainmeun() {
    //SelectionSort();
    //QuickSort();
    //InsertionSort();
    //CombSort();
    //BubbleSort();
    //ShellSort();
    //HeapSort();
    MergeSort();
}


int main() {
    mainmeun();
    return 0;
}