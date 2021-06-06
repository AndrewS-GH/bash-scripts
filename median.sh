#!/bin/bash
# Andrew Samost
# mymedian
#
# Description:	Returns the median value from a list of integers stored in a file
#				that is passed as the argument
#
# Input:		Input is a single argument that is the name of a file containing a list
#				of integers, one per line, with a newline character at the end
#
# Output: 		The output is an integer which is the median of the list if there is an odd number
#				of integers, if there is an even amount the median is a float of the average of the 
#				middle two integers

if [ $# -eq 0 ]
	then
		echo "No argument passed"
elif [ $(wc -w < $1) -eq 0 ]
	then
		echo "file is empty"
else
	mid=$(wc -l < $1)  # number of elements
	midMod=$((mid % 2))  # 1 if odd number of ints, 0 if even
	let mid="$mid/2"  # midway point
	i=0
	while read A  # parse file add ints to array
	do
		files[$i]=$A
		let i=$i+1
	done < <(sort -n $1)
	if [ $midMod -eq 1 ]  # if odd, clear center
		then
			echo ${files[$mid]}
		else
			mid=`echo "${files[$mid]} ${files[$mid-1]}" | awk '{print $1 + $2}'`
			echo $mid/2 | bc -l

	fi
fi