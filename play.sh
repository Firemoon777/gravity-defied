#!/bin/bash 
clear
SLEEP=
TIME=300000
SED=`which sed`

# Check for sleep function
usleep $TIME 2>/dev/null
if [ $? == 0 ]
then
	SLEEP=usleep
else
	# Chech for floating point sleep
	sleep 0.$TIME 2>/dev/null
	if [ $? == 0 ] 
	then
		SLEEP=sleep
		TIME=0.$TIME
	else
		echo "Sleep with floating point or usleep don't found"
		exit
	fi
fi
# Check sed for -u
$SED -u '' /dev/null 2>/dev/null
# Try to use gsed instead
if [ $? != 0 ]
then
	gsed -u '' /dev/null 2>/dev/null
	if [ $? == 0 ] 
	then
		SED=gsed
	else
		echo "Your sed isn't compatible with game"
		exit
	fi	
fi
# Creating fifo for input
rm -f gravity-fifo;
mkfifo gravity-fifo;

# run game
$SED -Enf gravity.sed gravity-fifo &

# Prevent closing after echo
sleep 99999999 > gravity-fifo &
echo > gravity-fifo
# clock
while true
do 
	echo t > gravity-fifo
       	$SLEEP $TIME 
done &


# Pass key press to game
(while true 
do
	read -s -n 1 key 
	echo $key
	[[ $key == "q" ]] && pkill -P $$ 
done ) | $SED -u -e '/t/d' > gravity-fifo

# finish game
pkill -P $$


