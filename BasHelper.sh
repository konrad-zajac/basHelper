#!/bin/bash
source LIB/questions.sh
source LIB/operations.sh

source LIB/foo_str/add_front.sh
source LIB/foo_str/add_back/back_wi_ext.sh
source LIB/foo_str/add_back/back_wo_ext.sh
source LIB/foo_str/iter/iter_0.sh 
source LIB/foo_str/iter/iter_1.sh 
source LIB/foo_str/iter/iter_M.sh 
source LIB/foo_str/replace.sh 
source LIB/foo_str/rm/rm_num_frnt.sh 
source LIB/foo_str/rm/rm_string.sh 

source LIB/foo_mac/dock/zeroDD.sh
source LIB/foo_mac/dock/recentApps.sh
source LIB/foo_mac/scrShtPth.sh
source LIB/foo_mac/tgl/tglHf.sh
source LIB/foo_mac/tgl/tglBtyPrc.sh
source LIB/foo_mac/tgl/tglFinPth.sh
source LIB/foo_mac/tgl/tglExtVis.sh


source LIB/foo_img/merge/horMerge.sh
source LIB/foo_img/merge/verMerge.sh
source LIB/foo_img/crop/oneCrpOne.sh
source LIB/foo_img/crop/mulCrpOne.sh
source LIB/foo_img/crop/oneCrpMul.sh
source LIB/foo_img/crop/mulCrpMul.sh




source LIB/main/safety_function.sh
source LIB/main/delete_everything_else.sh


#source LIB/mac_operations/toggle_dock_visibility.sh


#source LIB/script/autoogide_OFF.scpt

function main {
operations main_choice
echo "Operation done"
ls -l
operations goodbye
}
function name_operations
{
questions manipulate
if [[ $string_choice == 0 ]];then
        questions adding_string
        if [ "$where" == "0" ];then
            add_front
        elif [ "$where" == "9" ];then
            back_wi_ext
        elif [ "$where" == "8" ];then
            back_wo_ext
    fi
    elif [[ $string_choice == 9 ]];then
	questions removing_string
        if [[ $removing_choice == 0 ]];then
            rm_num_frnt
        elif [[ $removing_choice == 9 ]];then
            rm_string
        fi
    elif [[ $string_choice == 8 ]]
    then
	questions modifying_string
			if [[ $modifying_choice == 0 ]];then
                replace
            elif [[ $modifying_choice == 9 ]];then
			    iter_0
            elif [[ $modifying_choice == 8 ]];then
			    iter_1
            elif [[ $modifying_choice == 7 ]];then
			    iter_M
            elif [[ $modifying_choice == 6 ]];then
			foo_str increment_folders
            elif [[ $modifying_choice == "Q" || "q" ]]
            then
                operations quit
       fi
    elif [[ $string_choice == "Q" || "q" ]]
    then
        operations quit
fi
}
function mac_operations
{
    questions mac_operations_questions
    if [[ $mac_choice == 0 ]];then
        ZeroDD
    elif [[ $mac_choice == 9 ]];then
        scrShtPth
    elif [[ $mac_choice == 8 ]];then
        tglHf
    elif [[ $mac_choice == 7 ]];then
        tglBtyPrc
    elif [[ $mac_choice == 6 ]];then
        recentApps
    elif [[ $mac_choice == 5 ]];then
        tglFinPth
    elif [[ $mac_choice == 4 ]];then
        tglExtVis
    elif [[ $mac_choice == "Q" || "q" ]];then
        operations quit
    fi
}
function image_operations
{
	questions IO_questions
    if [[ $image_choice == 0 ]]; then
        questions IO_merge_choice
        if [[ $merge_choice == 0 ]];then
            horMerge 
        elif [[ $merge_choice == 9 ]];then
            verMerge
        fi
    elif [[ $image_choice == 9 ]];then
        oneCrpOne
    elif [[ $image_choice == 8 ]];then
        mulCrpOne
    elif [[ $image_choice == 7 ]];then
        oneCrpMul
    elif [[ $image_choice == 6 ]];then
        mulCrpMul

    elif [[ $image_choice == "Q" || "q" ]];then
    operations quit
    fi
}
function other_operations
{
  questions OO_questions

    if [[ $oo_choice == 0 ]]
    then
      operations OO_conv_mov2mp4
    # elif [[ $oo_choice == 9 ]]
    # then
    #     operations delete_else
    elif [[ $oo_choice == 9 ]];then
        operations OO_sort
        operations OO_copy_many_files
    elif [[ $oo_choice == "Q" || "q" ]]
    then
        operations quit
    fi
}
main $@
