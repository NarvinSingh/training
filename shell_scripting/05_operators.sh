#!/bin/zsh

#
# Arithmetic Operators
#

echo '`expr 2 + 3` ->' `expr 2 + 3` # spaces around the operator are required
echo '`expr 2 - 3` ->' `expr 2 - 3`
echo '`expr 2 \* 3` ->' `expr 2 \* 3`
echo '`expr 8 / 3` ->' `expr 8 / 3` # integer division (floor)
echo '`expr 5 % 2` ->' `expr 5 % 2`
A=1
echo "A=1 -> A=$A"

echo -n '[ 1 = 1 ] -> ' # spaces around the brackets and operator are required
[ 1 = 1 ] && echo 'true'
echo -n '[ 1 = 2 ] -> '
[ 1 = 2 ] || echo 'false'
echo -n '[ "hello" = "hello" ] -> '
[ "hello" = "hello" ] && echo 'true'
echo -n '[ "HELLO" = "hello" ] -> '
[ "HELLO" = "hello" ] || echo 'false'

unsetopt EQUALS # need to disable equal expansion to use double-equal operator
echo -n '[ 1 == 1 ] -> '
[ 1 == 1 ] && echo 'true # unsetopt EQUALS'
echo -n '[ 1 == 2 ] -> '
[ 1 == 2 ] || echo 'false # unsetopt EQUALS'
echo -n '[ "hello" == "hello" ] -> '
[ "hello" == "hello" ] && echo 'true # unsetopt EQUALS'
echo -n '[ "HELLO" == "hello" ] -> '
[ "HELLO" == "hello" ] || echo 'false # unsetopt EQUALS'
setopt EQUALS

echo -n '[ 1 != 2 ] -> '
[ 1 != 2 ] && echo 'true'
echo -n '[ 1 != 1 ] -> '
[ 1 != 1 ] || echo 'false'
echo -n '[ "HELLO" != "hello" ] -> '
[ "HELLO" != "hello" ] && echo 'true'
echo -n '[ "hello" != "hello" ] -> '
[ "hello" != "hello" ] || echo 'false'

#
# Relational Operators
#
echo -n '[ 1 -eq 1 ] -> '
[ 1 -eq 1 ] && echo 'true'
echo -n '[ 1 -eq 2 ] -> '
[ 1 -eq 2 ] || echo 'false'
echo -n '[ "1" -eq "1" ] -> '
[ "1" -eq "1" ] && echo 'true'
echo -n '[ "1" -eq "2" ] -> '
[ "1" -eq "2" ] || echo 'false'

echo '[ 1 -ne 2 ]'
[ 1 -ne 2 ] && echo 'true'
echo '[ 1 -ne 1 ]'
[ 1 -ne 1 ] || echo 'false'
echo '[ 1 -ne 2 ]'
[ 1 -ne 2 ] && echo 'true'
echo '[ 1 -ne 1 ]'
[ 1 -ne 1 ] || echo 'false'

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

