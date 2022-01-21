//
// Created by shiyi on 01/21/2022.
//

#include <stdio.h>

__global__ void helloFromGpu()
{
    const int bid = blockIdx.x;
    const int tx = threadIdx.x;
    const int ty = threadIdx.y;
    printf("Hello World from block-%d and thread-(%d, %d)!\n", bid, tx, ty);
}

int main(void)
{
    const dim3 block_size(2, 4);
    helloFromGpu<<<1, block_size>>>();
    cudaDeviceSynchronize();

    return 0;
}