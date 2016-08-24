#!/bin/bash

if [ -z "$1" ]; then  #if null
	echo "Give an input word"
	exit -1
fi

echo "downloading..."
wget -O temp.html https:\/\/en.wiktionary.org\/wiki\/$1
#wget -O temp.html https:\/\/en.wiktionary.org\/wiki\/$1\%23Finnish

if [ -z "$2" ]; then
	echo "==>$1" >> wordlist.txt ;
	w3m -dump temp.html | grep -e "[1-4]. "| grep -v "last modified" >> wordlist.txt ;
	w3m -dump temp.html | more ;
elif [ $2 == "-q" ] ||[ $2 == "--quick" ]; then
	echo "==>$1" >> wordlist.txt
	w3m -dump temp.html | grep -e "[1-4]. "|grep -v "last modified" |tee -a wordlist.txt ;
else
	echo "unrecognised option. Exiting"
	rm temp.html
	exit -1
fi

rm temp.html
