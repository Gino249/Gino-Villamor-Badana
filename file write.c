#include <stdio.h>
#include <stdlib.h>

int main() {
    
    //File Write
    
    FILE *file = fopen("text.txt", "w");
    
    if(!file){
        
        perror("failed writing the file!");
        exit(1);
        
    }
    
    
    if(fprintf(file, "Hello World!")){
         printf("success!");
    }else{
        printf("success!");
    }
    
    fclose(file);
    
    return 0;
    
}