#!/bin/bash

for filename in *.hs; do
    echo "Testing $filename"
    stack exec -- doctest $filename
done
