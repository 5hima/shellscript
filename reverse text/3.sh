#!/bin/bash

cat $1 | tr " " "\n" | LC_ALL=C sort -r | xargs
