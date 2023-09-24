#!/bin/bash

. ../checks
. ../detect_colors
. ../functions

read_line_from_file
if check_arguments_part4 $# && check_integer ${ARRAY_COLORS_FROM_FILE[*]} && check_sequence ${ARRAY_COLORS_FROM_FILE[*]} && check_number_of_color ${ARRAY_COLORS_FROM_FILE[*]}
then
detect_colors ${ARRAY_COLORS_FROM_FILE[*]}
. ../take_system_info
echo -en $system_info
echo -en $to_print
fi
