#!/bin/bash

# 设置循环次数
num_iterations=15901

# 循环开始
for ((i=0; i<$num_iterations; i++)); do
    echo "x[$i] <== a[$i] + 1;"
    echo "y[$i] <== b[$i] * 2;"
    echo "c[$i] <== x[$i] * y[$i];"
    echo
done