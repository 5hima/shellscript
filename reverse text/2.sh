#!/bin/bash

cat $1 | awk '{for(i=NF; i > 1; i--)printf($i" ");printf($i"\n")}'
