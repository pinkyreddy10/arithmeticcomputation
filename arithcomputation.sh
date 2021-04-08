#! /bin/bash
declare -A dict
declare -A codes
a=4
b=2
c=6
res1=$(( a+b*c ))
res2=$(( a*b+c ))
res3=$(( c+a/b ))
res4=$(( a%b+c ))
dict=( ["0"]="res1" ["1"]="res2" ["2"]="res3" ["3"]="res4" )
codes=( ["res1"]="$(( a+b*c ))" ["res2"]="$(( a*b+c ))" ["res3"]="$(( c+a/b ))" ["res4"]="$(( a%b+c ))" )

for key in ${!dict[@]}
do
	echo $key ${codes[${dict[$key]}]}
done
