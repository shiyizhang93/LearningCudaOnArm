//
// Created by shiyi on 01/21/2022.
//

#include <stdio.h>

__global__ void helloFromGpu()
{
    const int bid = blockIdx.x;
    const int tid = threadIdx.x;
    printf("Hello World from block %d and thread %d!\n", bid, tid);
}

int main(void)
{
    helloFromGpu<<<2, 4>>>();
    cudaDeviceSynchronize();

    return 0;
}