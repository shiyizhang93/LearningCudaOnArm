//
// Created by shiyi on 01/21/2022.
//

#include <stdio.h>

__global__ void helloFromGpu()
{
    printf("Hello World from the GPU!\n");
}

int main(void)
{
    helloFromGpu<<<2, 4>>>(); // try with grid size 2 and block size 4
    cudaDeviceSynchronize();

    return 0;
}
