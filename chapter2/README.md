# Chapter 2
C++ source code compiling command:

    g++ hello.cpp -o hello 

CUDA source code compiling command: 
    
    nvcc hellox.cu -o hellox

I run the program on Jetson platform, here are some tips setting up CUDA environment variables:

    export LD_LIBRARY_PATH=/usr/local/cuda-10.2/lib64:$LD_LIBRARY_PATH
    export PATH=/usr/local/cuda-10.2/bin:$PATH
    export CUDA_ROOT=/usr/local/cuda-10.2

You can also add these environment variables in /etc/ld.so.conf and /etc/profile to make it long-term effective.