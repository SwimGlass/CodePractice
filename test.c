#include <stdio.h>
#include <stdlib.h>

int** transpose(int** matrix, int matrixSize, int* matrixColSize, int* returnSize, int** returnColumnSizes) {
    int **return_arr = (int **)malloc(sizeof(int *) * *matrixColSize);
    printf("return_arr = %x\n", return_arr);
    *(return_arr+0) = (int *)malloc(sizeof(int) * matrixSize);
    printf("*(return_arr+0) = %x\n", *(return_arr+0));
    /*for (int i = 0; i < *matrixColSize; i++) {
        *(return_arr+i) = (int *)malloc(sizeof(int) * matrixSize);
        printf("*(return_arr+i) = %x\n", *(return_arr+i));
    }*/
    returnSize = (int *)malloc(sizeof(int));
    returnColumnSizes = (int **)malloc(sizeof(int *));
    *returnColumnSizes = (int *)malloc(sizeof(int));
    **returnColumnSizes = matrixSize;
    returnSize = *matrixColSize;
    printf("matrixSize = %d, matrixColSize = %d\n", matrixSize, *matrixColSize);
    for (int i = 0; i < *matrixColSize; i++) {
        //printf("return_arr = %x\n", return_arr);
        return_arr[i] = (int *)malloc(sizeof(int) * matrixSize);
    }
    for (int j = 0; j < matrixSize; j++) {
        for (int i = 0; i < *matrixColSize; i++) {
            return_arr[i][j] = matrix[j][i];
        }
    }
    return return_arr;
}

int main(void) {
    int array[3][3] = {
     1, 2, 3,
     4, 5, 6,
     7, 8, 9,
    };
    int colSize = 3;
    int returnSize, *returnColumnSize;
    int **return_arr = transpose(array, 3, &colSize, &returnSize, &returnColumnSize);
    for(int i = 0; i < returnSize; i++) {
        free(return_arr[i]);
    }
    free(return_arr);
    return 0;
}
