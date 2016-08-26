#!/bin/bash
#it will work only with final depth tags, not tags which contain subtags


echo "read_dom.sh keyword file"

if [ -z "$1" ]; then  #if null
	echo "Give the key word"
	exit -1
fi

if [ -z "$2" ]; then  #if null
        echo "Give the file"
        exit -1
fi
#Okay so it defines a function called read_dom. 
#The first line makes IFS (the input field separator) local to this function and changes it to >. 
#That means that when you read data instead of automatically being split on space, tab or newlines it gets split on '>'. 
#The next line says to read input from stdin, and instead of stopping at a newline, stop when you see a '<' character (the -d for deliminator flag). 
#What is read is then split using the IFS and assigned to the variable ENTITY and CONTENT. So take the following:

read_dom () {
    local IFS=\>
    read -d \< ENTITY CONTENT
    local ret=$?
    TAG_NAME=${ENTITY%% *}
    ATTRIBUTES=${ENTITY#* }
    return $ret
}

#while read_dom; do
#    echo "$ENTITY => $CONTENT"
#done < input.xml

while read_dom; do
    if [[ $ENTITY = $1 ]] ; then
        echo $CONTENT
    fi
done < $2
