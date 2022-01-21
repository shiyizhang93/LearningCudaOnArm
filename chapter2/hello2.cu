//
// Created by shiyi on 01/20/2022.
//

#include <stdio.h>

__global__ void helloFromGpu()
{
    printf("Hello World from the GPU!\n");
}

int main(void)
{
    helloFromGpu<<<1, 1>>>();
    cudaDeviceSynchronize();

    return 0;
}
