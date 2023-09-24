#!/bin/bash

. ../checks
. ../detect_colors
. ../functions

#исследование системы при помощи Баш-скрипта

if check_first_arg_exist $@
then
. ../take_system_info 
echo -en "${system_info}"

yes_or_no
fi