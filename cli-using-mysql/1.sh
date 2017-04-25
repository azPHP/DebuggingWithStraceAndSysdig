#!/bin/bash

# The -s flag sets how much of each argument you are capturing for each system call
strace -s 200 ./test-cli
