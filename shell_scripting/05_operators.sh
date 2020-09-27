#!/bin/zsh

#
# Arithmetic Operators
#
# Note that the spaces around the operator and the numbers are required
echo '`expr 2 + 3`'
echo `expr 2 + 3`
echo

echo '`expr 2 - 3`'
echo `expr 2 - 3`
echo

echo '`expr 2 \* 3`'
echo `expr 2 \* 3`
echo

# Note that this is integer division (floor)
echo '`expr 8 / 3`'
echo `expr 8 / 3`
echo

echo '`expr 5 % 2`'
echo `expr 5 % 2`
echo

echo 'A=1'
A=1
echo "$A"
echo

# Note that the spaces around the brackets and the equal signs are required
echo '[ 1 == 1 ] (when unsetopt EQUALS)'
unsetopt EQUALS
[ 1 == 1 ] && echo 'true'
setopt EQUALS
echo

echo '[ 1 = 1 ]'
[ 1 = 1 ] && echo 'true'
echo

echo '[ 1 != 2 ]'
[ 1 != 2 ] && echo 'true'
echo

#
# Relational Operators
#
echo '[ 1 -eq 1 ]'
[ 1 -eq 1 ] && echo 'true'
echo

echo '[ 1 -ne 2 ]'
[ 1 -ne 2 ] && echo 'true'
echo

echo '[ 2 -gt 1 ]'
[ 2 -gt 1 ] && echo 'true'
echo

echo '[ 1 -lt 2 ]'
[ 1 -lt 2 ] && echo 'true'
echo

echo '[ 2 -ge 2 ]'
[ 2 -ge 2 ] && echo 'true'
echo

echo '[ 2 -le 2 ]'
[ 2 -le 2 ] && echo 'true'
echo

#
# Boolean Operators
#
echo '[ !false ]'
[ !false ] && echo 'true'
echo

echo '[ false -o true ]'
[ false -o true ] && echo 'true'
echo

echo '[ true -a true ]'
[ true -a true ] && echo 'true'
echo

#
# String Operators
#
echo '[ "a" == "a" ]'
unsetopt EQUALS
[ "a" == "a" ] && echo 'true'
setopt EQUALS
echo

echo '[ "a" != "b" ]'
[ "a" != "b" ] && echo 'true'
echo

echo '[ -z "" ]'
[ -z "" ] && echo 'true'
echo

echo '[ -n "hello" ]'
[ -n "hello" ] && echo 'true'
echo

echo '[ "hello" ]'
[ "hello" ] && echo 'true'
echo

echo '[ "" ]'
[ "" ] || echo 'false'
echo

#
# File Test Operators
#
# TODO

