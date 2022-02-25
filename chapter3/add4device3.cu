//! \Brief  Invoke device function by passing the value in reference method
//!
//! \Author Shiyi Zhang
//!
//! \Create 02/25/2022


#include <math.h>
#include <stdio.h>

const double EPSILON = 1.0e-15;
const double a = 1.23;
const double b = 2.34;
const double c = 3.57;

void __global__ add(const double *x, const double *y, double *z, int N);
void check(const double *z, const int N);

int main(void) {
    const int N = 100000001;
    const int M = sizeof(double) * N;
    // allocate host memory
    // initiate dynamic memory with new operator
    double *h_x = new double[N];
    double *h_y = new double[N];
    double *h_z = new double[N];

    // initialize host x,y array
    for (int i = 0; i < N; ++i) {
        h_x[i] = a;
        h_y[i] = b;
    }

    // allocate device memory
    double *d_x, *d_y, *d_z;
    cudaMalloc((void **) &d_x, M);
    cudaMalloc((void **) &d_y, M);
    cudaMalloc((void **) &d_z, M);
    // copy data from host to device
    cudaMemcpy(d_x, h_x, M, cudaMemcpyHostToDevice);
    cudaMemcpy(d_y, h_y, M, cudaMemcpyHostToDevice);
    // set grid size, block size and call add kernel function
    const int block_size = 128;
    const int grid_size = (N + block_size - 1) / block_size; // make grid_size round up to the closest int num
    add<<<grid_size, block_size>>>(d_x, d_y, d_z, N);
    // copy result back from device to host
    cudaMemcpy(h_z, d_z, M, cudaMemcpyDeviceToHost);
    check(h_z, N);
    // release host memory
    // use delete operator to release
    delete[] h_x;
    delete[] h_y;
    delete[] h_z;
    // release device memory
    cudaFree(d_x);
    cudaFree(d_y);
    cudaFree(d_z);

    return 0;
}

void __device__ add2_device(const double x, const double y, double &z)
{
    z = x + y;
}


void __global__ add(const double *x, const double *y, double *z, int N)
{
    const int n = blockDim.x * blockIdx.x + threadIdx.x;
    if (n < N)
    {
        add2_device(x[n], y[n], z[n]);
    }
}

void check(const double *z, const int N)
{
    bool has_error = false;
    for (int i = 0; i < N; ++i)
    {
        if (fabs(z[i] - c) > EPSILON)
        {
            has_error = true;
        }
    }
    printf("%s\n", has_error ? "Has errors" : "No errors");
}


