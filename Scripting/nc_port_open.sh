#!/bin/bash
#Sciprt to quickly check connection to IP with nc (timeout 2s)

port="22 80 433 3389"

nc -zvw1 $* $port