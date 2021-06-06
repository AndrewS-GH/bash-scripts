#!/bin/bash
# Andrew Samost
# myoccur
#
# Description:		finds the number of occurences of a word in a file
#
# Input:			the input is two arguments, a string which is a word you want to check
#					the occurnces for, and a name of a file
#
# Output:			the output will be an integer that represents how many times that word is in
#					the file, or an error message if the user did not enter in 2 arguments


if [ $# -ne 2 ]
then
	echo "Error: expected 2 arguments"
else
	grep -iow $1 $2 | wc -l
fi