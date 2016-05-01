#!/bin/bash
#============================================================
#
#          FILE:  install_ycm_env.sh
#
#         USAGE:  ./install_ycm_env.sh
#
#   DESCRIPTION:
#        AUTHOR:  hungyi liu 
#       VERSION:  1.0
#============================================================

currentWorkDirectory=`pwd`
initialYcmConfigFilePath=~/.vim/my_ycm_env/.ycm_extra_conf.py
workDirectoryYcmConfigPath=$currentWorkDirectory"/.ycm_extra_conf.py"
echo $workDirectoryYcmConfigPath

if [ -f $workDirectoryYcmConfigPath ];then
	rm -rf $workDirectoryYcmConfigPath
fi

cppHeaderExtensionArray=("*.h" "*.hpp" "*.hxx")
cppHeaderExtensionArrayLength=${#cppHeaderExtensionArray[*]}
findCppHeaderDirectoryCommandString="find $currentWorkDirectory -type f "

for ((i=0;i<$cppHeaderExtensionArrayLength;i++));
do
	if [ $i == 0 ];then
		findCppHeaderDirectoryCommandString+=" -iname "
	    findCppHeaderDirectoryCommandString+=${cppHeaderExtensionArray[$i]}	
	else
		findCppHeaderDirectoryCommandString+=" -o -iname "
	    findCppHeaderDirectoryCommandString+=${cppHeaderExtensionArray[$i]}	
	fi
done

findCppHeaderDirectoryCommand=`$findCppHeaderDirectoryCommandString`
cppHeaderDirectoryArray=()

echo $findCppHeaderDirectoryCommandString


for headerFile in $findCppHeaderDirectoryCommand; do
	cppHeaderDirectoryArray+=("$(dirname "$headerFile")")
done 

cppUniqueHeaderDirectoryArray=$(echo "${cppHeaderDirectoryArray[@]}" | tr ' ' '\n' | sort -u )
#cppUniqueHeaderDirectoryArray=$(echo "${cppHeaderDirectoryArray[@]}" | tr ' ' '\n' | sort -u | tr '\n' ' ')

echo ${cppUniqueHeaderDirectoryArray[@]}

cp $initialYcmConfigFilePath $workDirectoryYcmConfigPath

for headerPath in "${cppUniqueHeaderDirectoryArray[@]}"
do
	echo $headerPath
	sed -i "37a \"$headerPath\"," $workDirectoryYcmConfigPath
	sed -i "37a \"-I\"," $workDirectoryYcmConfigPath
done
