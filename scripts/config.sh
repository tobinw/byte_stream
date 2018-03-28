#!/bin/bash

if [ -z $1 ] ; then
  BUILD_TYPE=Debug
else
  BUILD_TYPE=$1
fi

cmake -DCMAKE_BUILD_TYPE=$BUILD_TYPE ../build
