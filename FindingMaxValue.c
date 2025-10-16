#include <stdio.h>

int main() {
    //Finding Max Value
    
    int size, max;
    int arrnum[] = {3,9,6,30,4,22,7};
    
     size = sizeof(arrnum) /sizeof(arrnum[0]);
     max = arrnum[0];
    
    for(int i = 0; i < size; i++ ){
        
        if(arrnum[i] > max){
            max = arrnum[i];
            
        }
    }
    
    printf("%d", max);
    
    return 0;
}