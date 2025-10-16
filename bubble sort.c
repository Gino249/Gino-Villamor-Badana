#include <stdio.h>


void sort(int arr[], int size){
    
    for(int i = 0; i < size - 1; i++){
        
        for(int j = 0; j < size - 1; j++){
            
            if(arr[j] > arr[j+1]){
                
                int temp = arr[j];
                arr[j] = arr[j+1];
                arr[j+1] = temp;
                
            }
        }
        
    }
}

void printArr(int arr[], int size){
    
    for(int i = 0; i < size; i++){
        printf("%d ", arr[i]);
    }
    
}

int main() {
    
    //Bubble Sort
    
    int arrnum[] = {2,8,9,6,3,1,5,10,4,7};
    int n = sizeof(arrnum) / sizeof(arrnum[0]);
    
    sort(arrnum, n);
    printArr(arrnum, n);
    
    return 0;
}