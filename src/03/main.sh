#!/bin/bash

. ../checks
. ../detect_colors

if check_arguments $# && check_integer $@ && check_sequence $@ && check_number_of_color $@
then
detect_colors $@
. ../take_system_info
echo -en $system_info
fi