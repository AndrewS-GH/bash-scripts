#!/bin/bash
# Andrew Samost
# myaverage
#
# Description:	finds the floating point average of a list of integers stored in a file
#				that is passed as the argument
#
# Input: 		Input is a single argument that is the name of a file containing a list
#				of integers, one per line, with a newline character at the end
#
# Output: 		The output is a floating point value that is the average of all of the integers in
#				the input file, as well as error messages if the file is empty or no argument was passed

#Error checking
if [ $# -eq 0 ]
	then
		echo "Error: Expected 1 argument"
elif [ $(wc -w < $1) -eq 0 ]
	then
		echo "Error: File is empty"
else
	sum=0
	while read A
	do
		let "sum=$sum + ${A/$'\r'/}"		#keeps track of sum
	done < <(cat $1)
	echo "$sum/$(wc -w < $1)" | bc -l 	#divides the sum by the wordocount
fi