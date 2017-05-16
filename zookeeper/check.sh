#!/bin/bash
inet=$1
if [ "$inet" == "" ]; then
    inet=eth0
fi

echo "2181 status"
echo stat | nc $inet 2181
echo "2182 status"
echo stat | nc $inet  2182
echo "2183 status"
echo stat | nc $inet  2183
