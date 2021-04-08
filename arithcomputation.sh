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

for (( i=0; i<3; i++ ))
do
	for (( j=$i; j<3; j++ ))
	do
		if [ ${codes[$i]} -lt ${codes[$j]} ]
		then
			temp=${codes[$i]}
			codes[$i]=${codes[$j]}
			codes[$j]=$temp
		fi
	done
done



for (( i=0; i<3; i++ ))
do
	for (( j=0; j<3-i-1; j++ ))
	do
		if [ ${codes[$j]} -gt ${codes[$(( j+1 ))]} ]
		then
			temp=${codes[$j]}
			codes[$j]=${codes[$(( j+1 ))]}
			codes[$(( j+1 ))]=$temp
		fi
	done
done
