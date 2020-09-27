#!/bin/zsh

# From https://www.tutorialspoint.com/unix/unix-special-variables.htm

#
# Special Variables
#
echo '$0 - filename of the current script'
echo $0
echo

echo '$1 - $n is the nth argument to the script'
echo $1
echo

echo '$# - the number of arguments to the script'
echo $#
echo

echo '$* - if double quoted, all of the arguments to the script as a single string'
echo '     otherwise, all of the arguments to the script as separate strings'

for TOKEN in $*
do
  echo "\$*: $TOKEN"
done

for TOKEN in "$*"
do
  echo "\"\$*\": $TOKEN"
done

echo

echo '$@ - all of the arguments to the script as separate strings'

for TOKEN in $@
do
  echo "\$@: $TOKEN"
done

for TOKEN in "$@"
do
  echo "\"\$@\": $TOKEN"
done

echo

echo '$? - exit code of the last command'
false # so $? will expand to 1
echo $?
echo

echo '$$ - process ID (PID) of the current shell'
echo $$
echo

echo '$! - PID of the last background command'
sleep 0 & # so $! will expand to the PID of this command
echo $!
echo

