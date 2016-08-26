#!/bin/bash
emails=($(cat ./$1 | grep -oP '(?<=email>)[^<]+'))

for i in ${!emails[*]}
do
  echo "$i" "${emails[$i]}"
  # instead of echo use the values to send emails, etc
done
