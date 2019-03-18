#!/bin/bash

for filename in code/*.hs; do
    echo "Testing $filename"
    stack exec -- doctest $filename
done
