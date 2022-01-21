//
// Created by shiyi on 01/21/2022.
//

#include <math.h>
#include <stdlib.h>
#include <stdio.h>

const double EPSILON = 1.0e-15;
const double a = 1.23;
const double b = 2.34;
const double c = 3.57;

void add();

int main(void)
{
    const int N = 100000000;
    const int M = sizeof(double) * N;

    // need 2.4GB memory
    // double data type will take 8 bytes
    double* x = (double*) malloc(M);
    double* y = (double*) malloc(M);
    double* z = (double*) malloc(M);


}