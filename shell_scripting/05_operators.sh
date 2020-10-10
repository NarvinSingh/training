#!/bin/bash
#
# Operator exercises from
# https://www.tutorialspoint.com/unix/unix-basic-operators.htm

readonly RED_FG=$(tput setaf 1)
readonly GREEN_FG=$(tput setaf 2)
readonly RESET_COLOR=$(tput sgr0)
readonly RED_FG_LEN=${#RED_FG}
readonly GREEN_FG_LEN=${#GREEN_FG}
readonly RESET_COLOR_LEN=${#RESET_COLOR}

################################################################################
# Prints a line with description, result and result type fields. This is
# a worker function and is meant to be called (curried) by the other print
# functions.
# Arguments:
#   The description
#   The result
#   The result type
# Outputs:
#   Writes the formatted string to stdout where the description and result
#   fields are left-aligned and have widths of ${p_opt_desc_width} and
#   ${p_opt_res_width}, respectively
################################################################################
p() {
  printf -v fmt '%%-%ds%%-%ds%%s\n' "${p_opt_desc_width}" "${p_opt_res_width}"
  printf "${fmt}" "$1" "$2" "$3"
}

################################################################################
# Prints a line with a description and a stdout result.
# Arguments:
#   The description
#   The result
# Outputs:
#   Writes the formatted string to stdout
################################################################################
pso() {
  p "$2" "$1" 'stdout'
}

################################################################################
# Prints a line with a description and a variable assignment result.
# Arguments:
#   The description
#   The result
# Outputs:
#   Writes the formatted string to stdout
################################################################################
pvar() {
  p "$2" "$1" 'variable'
}

################################################################################
# Prints a line with a description and an exit code result.
# Arguments:
#   The description
#   The result
# Outputs:
#   Writes the formatted string to stdout with the successful results colored
#   green and unsuccessful ones colored red.
################################################################################
pec() {
  saved_p_opt_res_width=$p_opt_res_width

  if [[ "$1" -eq 0 ]]; then
   colored_code="${GREEN_FG}$1${RESET_COLOR}"
   ((p_opt_res_width += GREEN_FG_LEN + RESET_COLOR_LEN))
  else
   colored_code="${RED_FG}$1${RESET_COLOR}"
   ((p_opt_res_width += RED_FG_LEN + RESET_COLOR_LEN))
  fi

  p "$2" "${colored_code}" 'exit code'
  p_opt_res_width=$saved_p_opt_res_width
}

################################################################################
# Arithmetic Operators
################################################################################
printf 'Arithmetic Operators\n'
printf -- '--------------------\n'

p_opt_desc_width=18
p_opt_res_width=5

pso `expr 2 + 3` '`expr 2 + 3`'
#          ^ ^ spaces around the operator are required
pso `expr 2 - 3` '`expr 2 - 3`'
pso `expr 2 \* 3` '`expr 2 \* 3`' # must escape the '*'
pso `expr 8 / 3` '`expr 8 / 3`'   # integer division (floor)
pso `expr 5 % 2` '`expr 5 %% 2`'
A=5; pvar "A=$A" 'A=5'
printf '\n'

[  1 = 1 ]; pec "$?" '[ 1 = 1 ]'
# ^ ^ ^ ^ spaces inside the brackets and around operator are required
[ 1 = 2 ]; pec "$?" '[ 1 = 2 ]'
[ "hi" = "hi" ]; pec "$?" '[ "hi" = "hi" ]'
[ "HI" = "hi" ]; pec "$?" '[ "HI" = "hi" ]'
printf '\n'

[ 1 == 1 ]; pec "$?" '[ 1 == 1 ]'
[ 1 == 2 ]; pec "$?" '[ 1 == 2 ]'
[ "hi" == "hi" ]; pec "$?" '[ "hi" == "hi" ]'
[ "HI" == "hi" ]; pec "$?" '[ "HI" == "hi" ]'
printf '\n'

[ 1 != 2 ]; pec "$?" '[ 1 != 2 ]'
[ 1 != 1 ]; pec "$?" '[ 1 != 1 ]'
[ "HI" != "hi" ]; pec "$?" '[ "HI" != "hi" ]'
[ "hi" != "hi" ]; pec "$?" '[ "hi" != "hi" ]'
printf '\n'

##################################################################################
# Relational Operators
##################################################################################
printf 'Relational Operators\n'
printf -- '--------------------\n'

[ 1 -eq 1 ]; pec "$?" '[ 1 -eq 1 ]'
[ 1 -eq 2 ]; pec "$?" '[ 1 -eq 2 ]'
[ "1" -eq "1" ]; pec "$?" '[ "1" -eq "1" ]'
[ "1" -eq "2" ]; pec "$?" '[ "1" -eq "2" ]'
[ "01" -eq "1" ]; pec "$?" '[ "01" -eq "1" ]'
# relational operators can only be used for numerical comparisons
[ 'a' -eq 'a' ] 2> /dev/null; pec "$?" "[ 'a' -eq 'a' ]"
printf '\n'

[ 1 -ne 2 ]; pec "$?" '[ 1 -ne 2 ]'
[ 1 -ne 1 ]; pec "$?" '[ 1 -ne 1 ]'
[ "1" -ne "2" ]; pec "$?" '[ "1" -ne "2" ]'
[ "1" -ne "1" ]; pec "$?" '[ "1" -ne "1" ]'
[ 'a' -ne 'b' ] 2> /dev/null; pec "$?" "[ 'a' -ne 'b' ]"
printf '\n'

[ 2 -gt 1 ]; pec "$?" '[ 2 -gt 1 ]'
[ 1 -gt 2 ]; pec "$?" '[ 1 -gt 2 ]'
[ 10 -gt 2 ]; pec "$?" '[ 10 -gt 2 ]'
[ "2" -gt "1" ]; pec "$?" '[ "2" -gt "1" ]'
[ "1" -gt "2" ]; pec "$?" '[ "1" -gt "2" ]'
[ 'b' -gt 'a' ] 2> /dev/null; pec "$?" "[ 'b' -gt 'a' ]"
printf '\n'

[ 1 -lt 2 ]; pec "$?" '[ 1 -lt 2 ]'
[ 2 -lt 1 ]; pec "$?" '[ 2 -lt 1 ]'
[ 2 -lt 10 ]; pec "$?" '[ 2 -lt 10 ]'
[ "1" -lt "2" ]; pec "$?" '[ "1" -lt "2" ]'
[ "2" -lt "1" ]; pec "$?" '[ "2" -lt "1" ]'
[ 'a' -lt 'b' ] 2> /dev/null; pec "$?" "[ 'a' -lt 'b' ]"
printf '\n'

[ 2 -ge 2 ]; pec "$?" '[ 2 -ge 2 ]'
[ 2 -ge 3 ]; pec "$?" '[ 2 -ge 3 ]'
[ 20 -ge 3 ]; pec "$?" '[ 20 -ge 3 ]'
[ "2" -ge "2" ]; pec "$?" '[ "2" -ge "2" ]'
[ "2" -ge "3" ]; pec "$?" '[ "2" -ge "3" ]'
[ 'a' -ge 'a' ] 2> /dev/null; pec "$?" "[ 'a' -ge 'a' ]"
printf '\n'

[ 2 -le 2 ]; pec "$?" '[ 2 -le 2 ]'
[ 3 -le 2 ]; pec "$?" '[ 3 -le 2 ]'
[ 3 -le 20 ]; pec "$?" '[ 3 -le 20 ]'
[ "2" -le "2" ]; pec "$?" '[ "2" -le "2" ]'
[ "3" -le "2" ]; pec "$?" '[ "3" -le "2" ]'
[ 'a' -le 'a' ] 2> /dev/null; pec "$?" "[ 'a' -le 'a' ]"
printf '\n'

##################################################################################
# Boolean Operators
##################################################################################
printf 'Boolean Operators\n'
printf -- '-----------------\n'

p_opt_desc_width=24

[ ! 1 -eq 2 ]; pec "$?" '[ ! 1 -eq 2 ]'
[ ! 1 -eq 1 ]; pec "$?" '[ ! 1 -eq 1 ]'
printf '\n'

[ 1 -eq 1 -o 1 -eq 1 ]; pec "$?" '[ 1 -eq 1 -o 1 -eq 1 ]'
[ 1 -eq 2 -o 1 -eq 1 ]; pec "$?" '[ 1 -eq 2 -o 1 -eq 1 ]'
[ 1 -eq 2 -o 1 -eq 2 ]; pec "$?" '[ 1 -eq 2 -o 1 -eq 2 ]'
printf '\n'

[ 1 -eq 1 -a 1 -eq 1 ]; pec "$?" '[ 1 -eq 1 -a 1 -eq 1 ]'
[ 1 -eq 2 -a 1 -eq 1 ]; pec "$?" '[ 1 -eq 2 -a 1 -eq 1 ]'
[ 1 -eq 2 -a 1 -eq 2 ]; pec "$?" '[ 1 -eq 2 -a 1 -eq 2 ]'
printf '\n'

##################################################################################
# String Operators
##################################################################################
printf 'String Operators\n'
printf -- '----------------\n'

p_opt_desc_width=18

[ "a" == "a" ]; pec "$?" '[ "a" == "a" ]'
[ "a" == "b" ]; pec "$?" '[ "a" == "b" ]'
[ "1" == "1" ]; pec "$?" '[ "1" == "1" ]'
[ "1" == "2" ]; pec "$?" '[ "1" == "2" ]'
[ 1 == 1 ]; pec "$?" '[ 1 == 1 ]'
[ 1 == 2 ]; pec "$?" '[ 1 == 2 ]'
# string operators perform lexical comparisons
[ "01" == "1" ]; pec "$?" '[ "01" == "1" ]'
printf '\n'

[ "a" != "b" ]; pec "$?" '[ "a" != "b" ]'
[ "a" != "a" ]; pec "$?" '[ "a" != "a" ]'
[ "1" != "2" ]; pec "$?" '[ "1" != "2" ]'
[ "1" != "1" ]; pec "$?" '[ "1" != "1" ]'
[ 1 != 2 ]; pec "$?" '[ 1 != 2 ]'
[ 1 != 1 ]; pec "$?" '[ 1 != 1 ]'
[ "01" != "1" ]; pec "$?" '[ "01" != "1" ]'
printf '\n'

[ -z '' ]; pec "$?" "[ -z '' ]"
[ -z 'a' ]; pec "$?" "[ -z 'a' ]"
printf '\n'

[ -n 'a' ]; pec "$?" "[ -n 'a' ]"
[ -n '' ]; pec "$?" "[ -n '' ]"
printf '\n'

[ 'a' ]; pec "$?" "[ 'a' ]"
[ '' ]; pec "$?" "[ '' ]"
printf '\n'

################################################################################
# File Test Operators
################################################################################
printf 'File Test Operators\n'
printf -- '-------------------\n'

p_opt_desc_width=24

[ -b /dev/sda ]; pec "$?" "[ -b /dev/sda ]"
[ -b /dev/tty ]; pec "$?" "[ -b /dev/tty ]"
printf '\n'

[ -c /dev/tty ]; pec "$?" "[ -c /dev/tty ]"
[ -c /dev/sda ]; pec "$?" "[ -c /dev/sda ]"
printf '\n'

[ -d /dev ]; pec "$?" "[ -d /dev ]"
[ -d /dev/tty ]; pec "$?" "[ -d /dev/tty ]"
printf '\n'

[ -f /etc/shells ]; pec "$?" "[ -f /etc/passwd ]"
[ -f /dev/tty ]; pec "$?" "[ -f /dev/tty ]"
printf '\n'

[ -g /usr/bin/crontab ]; pec "$?" "[ -g /usr/bin/crontab ]"
[ -g /dev/tty ]; pec "$?" "[ -g /dev/tty ]"
printf '\n'

# TODO: -k, -p, -t

[ -u /usr/bin/su ]; pec "$?" "[ -u /usr/bin/su ]"
[ -u /dev/tty ]; pec "$?" "[ -u /dev/tty ]"
printf '\n'

touch /tmp/tmp
chmod 0 /tmp/tmp

[ -r /dev/tty ]; pec "$?" "[ -r /dev/tty ]"
[ -r /tmp/tmp ]; pec "$?" "[ -r /tmp/tmp ]"
printf '\n'

[ -w /dev/tty ]; pec "$?" "[ -w /dev/tty ]"
[ -w /tmp/tmp ]; pec "$?" "[ -w /tmp/tmp ]"
printf '\n'

[ -x /usr/bin/su ]; pec "$?" "[ -x /usr/bin/su ]"
[ -x /tmp/tmp ]; pec "$?" "[ -x /tmp/tmp ]"
printf '\n'

[ -s /usr/bin/su ]; pec "$?" "[ -s /usr/bin/su ]"
[ -s /tmp/tmp ]; pec "$?" "[ -s /tmp/tmp ]"
printf '\n'

[ -e /dev/tty ]; pec "$?" "[ -e /dev/tty ]"
[ -e /tmp/tmp2 ]; pec "$?" "[ -e /tmp/tmp2 ]"
printf '\n'

rm -f /tmp/tmp

