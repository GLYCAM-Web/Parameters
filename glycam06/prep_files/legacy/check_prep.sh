#!/bin/bash
##
##  This checks to see if the indiv_prep_files directory contains any entries
##	not in the input prep file ($1 on the command line).
##
for i in $(grep "INT 0" indiv_prep_files/*.prep | tr -s ':' ' ' | cut -d ' ' -f2) ; do 
	j="$(grep -w "^$i" $1 | head -1 | cut -d ' ' -f1)" 
	if [ -z $j ] ; then
		echo "no match for $i"
	fi
done
i="supercalifragilisticexpialadocious"
j="$(grep -w "^$i" indiv_prep_files/*.prep | head -1 | cut -d ' ' -f1)"
if [ -z $j ] ; then
echo "Script is complete."
fi

