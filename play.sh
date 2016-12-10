#!/bin/sh
clear
SLEEP=sleep
TIME=0.5
SED=/usr/bin/sed

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


