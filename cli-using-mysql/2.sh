#!/bin/bash

# The '-e trace=' flag lets you limit output by type, 'network' and 'file' are super useful options
strace -s 200 -e trace=network ./test-cli
