#!/bin/zsh

# From https://www.tutorialspoint.com/unix/unix-using-arrays.htm

#
# Initialize an array.
#
# Method 1. Note that the indexing starts at 1 instead of 0.
NAME2=('Narvin' 'Marteena' 'Charlotte' 'Oscar')
echo "NAME1[1]: ${NAME1[1]}"
echo "NAME1[2]: ${NAME1[2]}"
echo "NAME1[3]: ${NAME1[3]}"
echo "NAME1[4]: ${NAME1[4]}"

# Method 2. Note that the indexing starts at 1 instead of 0.
set -A NAME3 'Narvin' 'Marteena' 'Charlotte' 'Oscar'
echo "NAME2[1]: ${NAME2[1]}"
echo "NAME2[2]: ${NAME2[2]}"
echo "NAME2[3]: ${NAME2[3]}"
echo "NAME2[4]: ${NAME2[4]}"

#
# Access all array items
#
NAME=('Narvin' 'Marteena' 'Charlotte' 'Oscar')

for TOKEN in ${NAME[*]}
do
  echo "[*]: $TOKEN"
done

for TOKEN in "${NAME[*]}"
do
  echo "\"[*]\": $TOKEN"
done

for TOKEN in ${NAME[@]}
do
  echo "[@]: $TOKEN"
done

for TOKEN in "${NAME[@]}"
do
  echo "\"[@]\": $TOKEN"
done

