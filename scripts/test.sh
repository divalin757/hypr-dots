#!/bin/bash

while true; do 
  clear
  acpi |awk '{ print $4 }'
  sleep 1
done
