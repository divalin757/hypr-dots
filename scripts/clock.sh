#!/bin/bash

clear
while true; do
   timedatectl |rg "Local time:" |awk '{ print $5 }'
   sleep 1
   clear
done

